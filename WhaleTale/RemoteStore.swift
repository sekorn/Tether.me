//
//  RemoteStore.swift
//  WhaleTale
//
//  Created by Scott on 4/15/16.
//  Copyright © 2016 Scott Kornblatt. All rights reserved.
//

import Foundation
import CoreData

protocol RemoteStore {
    func signUp(phoneNumber phoneNumber: String, email: String, password: String, success:()->(), error:(errorMessage:String)->())
    func startSyncing()
    func store(inserted inserted: [NSManagedObject], updated: [NSManagedObject], deleted: [NSManagedObject])
}