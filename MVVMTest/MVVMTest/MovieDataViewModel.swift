//
//  DataViewModel.swift
//  MVVMTest
//
//  Created by Downey, Eric on 12/5/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MovieDataViewModel {
    
    private var movieManager: MovieManager = MovieManager.shared
    var movieCount: Int {
        return movieManager.movies.count
    }
    
    func requestMovies(with completion: @escaping (Void) -> Void) {
        movieManager.requestMovies { movies, error in
            if let e = error {
                print("******************")
                print("There was an error")
                print("Error: \(e)")
                print("******************")
            }
            if let m = movies, m.count > 0 {
                print("******************")
                print("Found Movies")
                print("Movie Count: \(m.count)")
                print("******************")
            }
            completion()
        }
    }
    
    func movie(at index: Int) -> (title: String?, year: String?) {
        let movie = movieManager.movie(at: index)
        return (movie?.title, movie?.year)
    }
    
    func poster(forMovieAt index: Int, with completion: @escaping (UIImage?, Error?) -> Void) {
        movieManager.poster(forMovieAt: index, with: completion)
    }
}
