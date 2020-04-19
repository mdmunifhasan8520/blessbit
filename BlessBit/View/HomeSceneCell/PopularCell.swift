//
//  PopularCell.swift
//  BlessBit
//
//  Created by Mac PC on 4/1/20.
//  Copyright © 2020 Ticon. All rights reserved.
//

import UIKit

class PopularCell: UICollectionViewCell {
    
    @IBOutlet weak var popular_banner_image: UIImageView!
    @IBOutlet weak var popular_title: UILabel!
    @IBOutlet weak var popular_release_date: UILabel!
    @IBOutlet weak var popular_duration: UILabel!
    @IBOutlet weak var popular_age_limit: UILabel!
    
    
    func updateViews(popular: Popular) {
        popular_banner_image.sd_setImage(with: URL(string: "\(popular.bgImg)"))
        popular_title.text = popular.title
        popular_release_date.text = popular.release_date
        popular_duration.text = String(popular.duration)
        popular_age_limit.text = popular.age_limit
    }
}
