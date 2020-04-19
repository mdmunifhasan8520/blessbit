//
//  MovieCell.swift
//  BlessBit
//
//  Created by Mac PC on 4/1/20.
//  Copyright © 2020 Ticon. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var movie_banner_image: UIImageView!
    @IBOutlet weak var movie_title: UILabel!
    @IBOutlet weak var movie_release_date: UILabel!
    @IBOutlet weak var movie_duration: UILabel!
    @IBOutlet weak var movie_age_limit: UILabel!
    
    
    func updateViews(movie: Movie) {
        movie_banner_image.sd_setImage(with: URL(string: "\(movie.bgImg)"))
        movie_title.text = movie.title
        movie_release_date.text = movie.release_date
        movie_duration.text = String(movie.duration)
        movie_age_limit.text = movie.age_limit
    }
}
