//
//  ContextViewController.swift
//  WhaleTale
//
//  Created by Scott on 4/12/16.
//  Copyright © 2016 Scott Kornblatt. All rights reserved.
//

import Foundation
import CoreData

protocol ContextViewController {
    var context: NSManagedObjectContext?{get set}
}