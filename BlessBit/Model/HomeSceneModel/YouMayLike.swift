//
//  YouMayLike.swift
//  BlessBit
//
//  Created by Mac PC on 4/6/20.
//  Copyright © 2020 Ticon. All rights reserved.
//

import Foundation

class YouMayLike: Movie {
    override init(bgImg:String, title: String, release_date: String, age_limit: String, duration: String, description: String, genres: String, certificate: String, creator:String ,cast:String,movieURL: String) {
        super.init(bgImg: bgImg, title: title, release_date: release_date, age_limit: age_limit, duration: duration, description: description, genres: genres, certificate: certificate, creator: creator, cast: cast, movieURL: movieURL)
    }
}
