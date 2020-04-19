//
//  CustomTabBar.swift
//  BlessBit
//
//  Created by Mac PC on 4/2/20.
//  Copyright © 2020 Ticon. All rights reserved.
//

import UIKit


class CustomTabBar: UITabBar {
    
    //for raised tabbar curved
    override func draw(_ rect: CGRect) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath().cgPath
        //shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1.0
        self.layer.insertSublayer(shapeLayer, at: 0)
        
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: -0.1, height: 10)
        self.layer.shadowRadius = 30
        self.layer.shadowColor = UIColor.lightGray.cgColor
        
    }
    
    func createPath() -> UIBezierPath {
        let radius : CGFloat =  40;
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: ((self.frame.width/2) - radius), y: 0))
        path.addArc(withCenter: CGPoint(x: (self.frame.width/2), y: 0), radius: radius, startAngle: CGFloat(M_PI) , endAngle: CGFloat(0) , clockwise: true)
        path.addLine(to: CGPoint(x:self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
        return path
    }
    
        //background image set for 2nd tab bar item
        var bgImage: UIImageView?
    
        override func awakeFromNib() {
            super.awakeFromNib()
    
            var image: UIImage = UIImage(named: "logo-btm-blue")!
            bgImage = UIImageView(image: image)

            self.addSubview(bgImage!)
        }
    
        override func layoutSubviews() {
            super.layoutSubviews()
            //bgImage!.frame = CGRect(x: self.frame.width/2 - 30, y: self.frame.height/2 - 55, width: 60, height: 60) //for ipad - 60 is perfect // for iphone -55 right //will be changed into frame/bounds relation
            // bgImage!.frame = CGRect(x: self.frame.width/2 - 30, y: self.frame.height/2 - frame.height, width: 60, height: 60)
             bgImage!.frame = CGRect(x: self.frame.width/2 - (bgImage?.frame.midY)!*6, y: -25, width: 60, height: 60)
        }

}


