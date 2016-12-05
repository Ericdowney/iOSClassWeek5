//
//  ViewController.swift
//  MVVMTest
//
//  Created by Downey, Eric on 12/5/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var movieTable: UITableView?
    
    var viewModel: MovieDataViewModel = MovieDataViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.requestMovies { [weak self] in
            self?.movieTable?.reloadData()
        }
    }
    
    // MARK: - Prepare for Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // TODO: Implement Me
    }

    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let movie = viewModel.movie(at: indexPath.row)
        
        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.text = movie.year
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: UIView.areAnimationsEnabled)
    }
}

