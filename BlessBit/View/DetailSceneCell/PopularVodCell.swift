//
//  PopularVodCell.swift
//  BlessBit
//
//  Created by Mac PC on 4/6/20.
//  Copyright © 2020 Ticon. All rights reserved.
//

import UIKit

class PopularVodCell: UICollectionViewCell {
    
    @IBOutlet weak var popularVod_banner_image: UIImageView!
    @IBOutlet weak var popularVod_title: UILabel!
    @IBOutlet weak var popularVod_release_date: UILabel!
    @IBOutlet weak var popularVod_duration: UILabel!
    @IBOutlet weak var popularVod_age_limit: UILabel!
    
    
    func updateViews(popularVod: PopularVod) {
        popularVod_banner_image.sd_setImage(with: URL(string: "\(popularVod.bgImg)"))
        popularVod_title.text = popularVod.title
        popularVod_release_date.text = popularVod.release_date
        popularVod_duration.text = String(popularVod.duration)
        popularVod_age_limit.text = popularVod.age_limit
    }
}
