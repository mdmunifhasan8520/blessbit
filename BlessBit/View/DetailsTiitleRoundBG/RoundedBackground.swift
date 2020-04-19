//
//  RoundedBackground.swift
//  BlessBit
//
//  Created by Mac PC on 4/8/20.
//  Copyright © 2020 Ticon. All rights reserved.
//

import UIKit

class RoundedBackground: UIView {
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    func setup () {
        backgroundColor = #colorLiteral(red: 0.9302220941, green: 0.945722878, blue: 0.9493127465, alpha: 1)
        layer.cornerRadius = 15
    }
}
