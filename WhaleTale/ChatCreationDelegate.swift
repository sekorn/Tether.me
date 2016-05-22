//
//  ChatCreationDelegate.swift
//  WhaleTale
//
//  Created by Scott on 4/5/16.
//  Copyright © 2016 Scott Kornblatt. All rights reserved.
//
//  This delegate class serves to notify any classes that subscribe to it that a chat has been created

import Foundation
import CoreData

protocol ChatCreationDelegate {
    func created(chat: Chat, inContext: NSManagedObjectContext)
}