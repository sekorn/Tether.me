//
//  Chat.swift
//  WhaleTale
//
//  Created by Scott on 3/30/16.
//  Copyright © 2016 Scott Kornblatt. All rights reserved.
//

import Foundation
import CoreData


class Chat: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    var isGroupChat: Bool {
        return participants?.count > 1
    }
    
    var lastMessage: Message? {
        let request = NSFetchRequest(entityName: "Message")
        request.predicate = NSPredicate(format: "chat=%@", self)
        request.sortDescriptors = [NSSortDescriptor(key: "timestamp", ascending: false)]
        request.fetchLimit = 1
        do {
            guard let results = try self.managedObjectContext?.executeFetchRequest(request) as? [Message] else {return nil}
            return results.first
        }
        catch {
            print("Error for Request")
        }
        return nil
    }
    
    func add(participant contact: Contact) {
        mutableSetValueForKey("participants").addObject(contact)
    }
    
    static func existing(directWith contact: Contact, inContext context: NSManagedObjectContext) -> Chat? {
        let request = NSFetchRequest(entityName: "Chat")
        request.predicate = NSPredicate(format: "ANY participants = %@ AND participants.@count = 1", contact)
        do {
            guard let results = try context.executeFetchRequest(request) as? [Chat] else {return nil}
            return results.first as Chat?
        }
        catch {
            print("Error fetching")
        }
        return nil
    }
    
    static func new(directWith contact: Contact, inContext context: NSManagedObjectContext) -> Chat {
        let chat = NSEntityDescription.insertNewObjectForEntityForName("Chat", inManagedObjectContext: context) as! Chat
        chat.add(participant: contact)
        return chat
    }
}
