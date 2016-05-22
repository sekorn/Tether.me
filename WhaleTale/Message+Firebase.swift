//
//  Message+Firebase.swift
//  WhaleTale
//
//  Created by Scott on 4/22/16.
//  Copyright © 2016 Scott Kornblatt. All rights reserved.
//

import Foundation
import Firebase
import CoreData

extension Message: FirebaseModel {
    func upload(rootRef: FIRDatabaseReference, context: NSManagedObjectContext) {
        
        if chat?.storageId == nil {
            chat?.upload(rootRef, context: context)
        }
        
        let data = [
            "message" : text!,
            "sender" : FirebaseStore.currentPhoneNumber!
        ]
        guard let chat = chat, timestamp = timestamp, storageId = chat.storageId else {return}
        let timeInterval = String(Int(timestamp.timeIntervalSince1970 * 100000))
        rootRef.child("chats/" + storageId + "/messages/" + timeInterval).setValue(data)
    }
}