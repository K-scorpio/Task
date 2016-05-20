//
//  Task.swift
//  Task
//
//  Created by Kevin Hartley on 5/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class Task: NSManagedObject {
    
    convenience init(name: String, notes: String? = nil, due: NSDate? = nil, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        // there is no graceful way to respond to a failure on NSEntityDescription.entityForName, force unwrapping and forcing a crash is the desired behavior for this app
        
        // designated initializer
        
        let entity = NSEntityDescription.entityForName("Task", inManagedObjectContext: context)!
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        // set properties here
    }
    
}