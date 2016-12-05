//
//  Movie.swift
//  MVVMTest
//
//  Created by Downey, Eric on 12/5/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SwiftyJSON

struct Movie {
    var title: String
    var year: String
    var posterUrl: String
    init?(json: JSON) {
        guard let t = json["Title"].string,
            let y = json["Year"].string,
            let p = json["Poster"].string else {
                return nil
        }
        title = t
        year = y
        posterUrl = p
    }
}
