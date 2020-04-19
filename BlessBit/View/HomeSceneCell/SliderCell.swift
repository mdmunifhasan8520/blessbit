//
//  SliderCell.swift
//  BlessBit
//
//  Created by Mac PC on 3/23/20.
//  Copyright © 2020 Ticon. All rights reserved.
//

import UIKit
import SDWebImage


class SliderCell: UICollectionViewCell {
    
    @IBOutlet weak var slider_banner_image: UIImageView!
    @IBOutlet weak var slider_title: UILabel!
    @IBOutlet weak var slider_release_date: UILabel!
    @IBOutlet weak var slider_duration: UILabel!
    @IBOutlet weak var slider_age_limit: UILabel!
    @IBOutlet weak var slider_description: UILabel!
    
    
    func updateViews(slider: Slider) {
        ///imageView.sd_setImage(with: URL(string: "http://www.domain.com/path/to/image.jpg"), placeholderImage: UIImage(named: "placeholder.png"))
        //slider_banner_image.sd_setImage(with: URL(string: "\(slider.bgImg)"), placeholderImage: UIImage(named: "loading.png"))
        slider_banner_image.sd_setImage(with: URL(string: "\(slider.bgImg)"))
        slider_title.text = slider.title
        slider_release_date.text = slider.release_date
        slider_duration.text = slider.duration
        slider_age_limit.text = slider.age_limit
        slider_description.text = slider.description
    }
}
