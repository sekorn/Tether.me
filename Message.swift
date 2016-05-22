//
//  Message.swift
//  WhaleTale
//
//  Created by Scott on 3/29/16.
//  Copyright © 2016 Scott Kornblatt. All rights reserved.
//

import Foundation
import CoreData


class Message: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    var isIncoming: Bool {
        return sender != nil
        //return false
    }
}
