//
//  TaskController.swift
//  Task
//
//  Created by Kevin Hartley on 5/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    static let sharedInstance = TaskController()
    
    var tasks = [Task]()
    
    init() {
        self.mockTasks
    }
    
    var completedTasks: [Task] {
        let request = NSFetchRequest(entityName: "Task")
        
        let moc = Stack.sharedStack.managedObjectContext
        
        let tasks = (try? moc.executeFetchRequest(request)) as? [Task] ?? []
        
        return tasks.filter({$0.isComplete == true})
    }
    
    var incompleteTasks: [Task] {
        let request = NSFetchRequest(entityName: "Task")
        let moc = Stack.sharedStack.managedObjectContext
        let tasks = (try? moc.executeFetchRequest(request)) as? [Task] ?? []
        
        return tasks.filter({$0.isComplete == false})
        
    }
    
    func addTask(name: String, notes: String?, due: NSDate?) {
        let _ = Task(name: name)
        saveToPersistentStore()
    }
    
    func removeTask(task: Task) {
        if let moc = task.managedObjectContext {
            moc.deleteObject(task)
            saveToPersistentStore()
        }
    }
    
    func updateTask(task: Task, name: String, notes: String?, due: NSDate?, isComplete: Bool) {
        task.name = name
        task.due = due
        task.notes = notes
        
    }
    
    func saveToPersistentStore() {
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("There was an error saving to persistent store")
        }
    }
    
    func fetchTasks() -> [Task] {
        return mockTasks
    }
    
    var mockTasks:[Task] {
        let doLaundry = Task(name: "Do Laundry", notes: "Darks", due: nil)
        let washDishes = Task(name: "WashDishes", notes: "when you can")
        let groceryShopping = Task(name: "Grocery Shopping", notes: "Eggs & Milk", due: NSDate.self())
        
        return [doLaundry, washDishes, groceryShopping]
    }

}