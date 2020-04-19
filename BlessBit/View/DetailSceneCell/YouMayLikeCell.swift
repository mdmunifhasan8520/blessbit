//
//  YouMayLikeCell.swift
//  BlessBit
//
//  Created by Mac PC on 4/6/20.
//  Copyright © 2020 Ticon. All rights reserved.
//

import UIKit

class YouMayLikeCell: UICollectionViewCell {
    
    @IBOutlet weak var youMayLike_banner_image: UIImageView!
    @IBOutlet weak var youMayLike_title: UILabel!
    @IBOutlet weak var youMayLike_release_date: UILabel!
    @IBOutlet weak var youMayLike_duration: UILabel!
    @IBOutlet weak var youMayLike_age_limit: UILabel!
    
    
    func updateViews(youMayLike: YouMayLike) {
        youMayLike_banner_image.sd_setImage(with: URL(string: "\(youMayLike.bgImg)"))
        youMayLike_title.text = youMayLike.title
        youMayLike_release_date.text = youMayLike.release_date
        youMayLike_duration.text = String(youMayLike.duration)
        youMayLike_age_limit.text = youMayLike.age_limit
    }
}
