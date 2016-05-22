//
//  UIView+Rotate.swift
//  tetherUSv5
//
//  Created by Scott on 5/3/16.
//  Copyright © 2016 Scott Kornblatt. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func rotate(radians: CGFloat?) {
        guard let rads = radians else {return}
        let angle = (rads * 180.0)/CGFloat(M_PI)
        
        UIView.animateWithDuration(0.5, animations: {
            self.transform = CGAffineTransformMakeRotation(angle)
        })
    }
}