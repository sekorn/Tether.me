//
//  Arrow.swift
//  tetherUSv5
//
//  Created by Scott on 4/25/16.
//  Copyright © 2016 Scott Kornblatt. All rights reserved.
//

import UIKit

class Arrow: UIView {
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let imageView = UIImageView(image: UIImage(named: "MainArrow"))
        imageView.backgroundColor = UIColor.clearColor()
        self.addSubview(imageView)
    }

}