//
//  Movie.swift
//  BlessBit
//
//  Created by Mac PC on 3/31/20.
//  Copyright © 2020 Ticon. All rights reserved.
//

import Foundation


class Movie {
    public var bgImg: String
    public var title: String
    public var release_date: String
    public var age_limit: String
    public var duration: String
    public var description: String
    public var genres: String
    public var certificate: String
    public var creator: String
    public var cast: String
    public var movieURL: String
    
    
    //Initialization
    init(bgImg: String, title: String,release_date: String,age_limit:String,duration:String,description: String, genres: String, certificate: String, creator:String, cast:String, movieURL: String){
        
        self.bgImg = bgImg
        self.title = title
        self.release_date = release_date
        self.duration = duration
        self.age_limit = age_limit
        self.description = description
        self.genres = genres
        self.certificate = certificate
        self.creator = creator
        self.cast = cast
        self.movieURL = movieURL
        
    }
}



