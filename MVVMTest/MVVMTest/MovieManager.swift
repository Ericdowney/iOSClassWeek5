//
//  MovieSingleton.swift
//  MVVMTest
//
//  Created by Downey, Eric on 12/5/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

private extension Array {
    func value(at index: Int) -> Element? {
        guard index >= 0 && index < endIndex else {
            return nil
        }
        return self[index]
    }
}

class MovieManager {
    static let shared: MovieManager = MovieManager()
    
    var movies: [Movie]
    
    private init() {
        movies = []
    }
    
    // MARK: - Safe Accessors
    
    func movie(at index: Int) -> Movie? {
        return movies.value(at: index)
    }
    
    // MARK: - Request Movies / Posters
    
    func requestMovies(with completion: @escaping ([Movie]?, Error?) -> Void) {
        Alamofire.request("http://www.omdbapi.com/?r=json&s=Christmas").validate().responseJSON { [weak self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let searchResults = json["Search"].arrayValue
                self?.movies = searchResults.flatMap {
                    Movie(json: $0)
                }
                
                completion(self?.movies, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func poster(forMovieAt index: Int, with completion: @escaping (UIImage?, Error?) -> Void) {
        Alamofire.request(movies[index].posterUrl).validate().responseData { response in
            switch response.result {
            case .success(let value):
                completion(UIImage(data: value), nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
