//
//  RecentCell.swift
//  BlessBit
//
//  Created by Mac PC on 3/30/20.
//  Copyright © 2020 Ticon. All rights reserved.
//

import UIKit

class RecentCell: UICollectionViewCell {
    
    @IBOutlet weak var recent_banner_image: UIImageView!
    @IBOutlet weak var recent_title: UILabel!
    @IBOutlet weak var recent_release_date: UILabel!
    @IBOutlet weak var recent_duration: UILabel!
    @IBOutlet weak var recent_age_limit: UILabel!
    
    func updateViews(recent: Recent) {
        recent_banner_image.sd_setImage(with: URL(string: "\(recent.bgImg)"))
        recent_title.text = recent.title
        recent_release_date.text = recent.release_date
        recent_duration.text = String(recent.duration)
        recent_age_limit.text = recent.age_limit
    }
}

