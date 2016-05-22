//
//  Compass.swift
//  tetherUSv5
//
//  Created by Scott on 4/24/16.
//  Copyright © 2016 Scott Kornblatt. All rights reserved.
//

import Foundation
import CoreLocation
import CoreData

class Compass: CLLocationManager {
    
    var pointDelegate: PositionUpdatedDelegate?
    
    var coords:(lat:Double, long:Double)?
    private var direction: CLLocationDirection?
    
    private var sync:Bool? = false
    
    private var timer: NSTimer!
    
    override init(){
        super.init()

        if CLLocationManager.authorizationStatus() != .AuthorizedWhenInUse {
            self.requestWhenInUseAuthorization()
        }
        
        self.delegate = self
        self.startUpdatingHeading()
        self.startUpdatingLocation()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(30, target: self, selector: Selector("throttleCoordinateSend:"), userInfo: nil, repeats: true)
    }
    
    func throttleCoordinateSend(timer: NSTimer) {
        sync = true
    }
}

extension Compass: CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if self.sync! {
            guard let lat = manager.location?.coordinate.latitude else {return}
            guard let long = manager.location?.coordinate.longitude else {return}
            
            coords = (lat, long)
            pointDelegate?.updatedPositions()
            sync = !sync!
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        let direction = newHeading.magneticHeading
        let radians = -direction / 180.0 * M_PI
        
        
    }
}