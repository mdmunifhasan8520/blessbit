//
//  EditorCell.swift
//  BlessBit
//
//  Created by Mac PC on 4/1/20.
//  Copyright © 2020 Ticon. All rights reserved.
//

import UIKit

class EditorCell: UICollectionViewCell {
    
    @IBOutlet weak var editor_banner_image: UIImageView!
    @IBOutlet weak var editor_title: UILabel!
    @IBOutlet weak var editor_release_date: UILabel!
    @IBOutlet weak var editor_duration: UILabel!
    @IBOutlet weak var editor_age_limit: UILabel!
    
    
    func updateViews(editor: Editor) {
        editor_banner_image.sd_setImage(with: URL(string: "\(editor.bgImg)"))
        editor_title.text = editor.title
        editor_release_date.text = editor.release_date
        editor_duration.text = String(editor.duration)
        editor_age_limit.text = editor.age_limit
    }
}
