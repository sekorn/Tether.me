//
//  Chat+CoreDataProperties.swift
//  WhaleTale
//
//  Created by Scott on 4/21/16.
//  Copyright © 2016 Scott Kornblatt. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Chat {

    @NSManaged var lastMessageTime: NSDate?
    @NSManaged var name: String?
    @NSManaged var storageId: String?
    @NSManaged var messages: NSSet?
    @NSManaged var participants: NSSet?

}
