//
//  MovieDetailsViewController.swift
//  MVVMTest
//
//  Created by Downey, Eric on 12/5/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    var selectedMovieIndex: Int?
    
    var viewModel: MovieDataViewModel = MovieDataViewModel()
    
    @IBOutlet var movieTitle: UILabel?
    @IBOutlet var movieYear: UILabel?
    @IBOutlet var moviePoster: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selectedIndex = selectedMovieIndex {
            let selectedMovie = viewModel.movie(at: selectedIndex)
            movieTitle?.text = selectedMovie.title
            movieYear?.text = selectedMovie.year
            
            viewModel.poster(forMovieAt: selectedIndex) { [weak self] img, _ in
                self?.moviePoster?.image = img
            }
        }
    }
    
}
