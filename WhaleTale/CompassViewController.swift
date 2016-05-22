//
//  CompassViewController.swift
//  tetherUSv5
//
//  Created by Scott on 4/24/16.
//  Copyright © 2016 Scott Kornblatt. All rights reserved.
//

import UIKit
import CoreLocation

class CompassViewController: UIViewController, PositionUpdatedDelegate {
    
    let width: CGFloat = 125.0
    let height: CGFloat = 305.0
    
    private var compass = Compass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        compass.pointDelegate = self
        
        let arrowView = Arrow(frame: CGRect(x: 0, y: 0, width: width, height: height))
        arrowView.backgroundColor = UIColor.clearColor()
        arrowView.center = self.view.center
        self.view.addSubview(arrowView)
        
        arrowView.rotate(0.5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updatedPositions() {
        //print(compass.coords)
    }
}
