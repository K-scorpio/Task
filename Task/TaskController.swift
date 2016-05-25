//
//  TaskController.swift
//  Task
//
//  Created by Kevin Hartley on 5/25/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class TaskController {
    
    static let sharedInstance = TaskController()
    
    var tasks: [Task] = []
    
    init() {
        tasks = fetchTasks()
    }
    
    var mockTasks:[Task] {
        let makeBreakfast = Task(name: "Make Breakfast", notes: "Pankcakes", due: nil)
        let goRunning = Task(name: "Go Running", notes: "Mountain Hill", due: nil)
        goRunning.isComplete = true
        let doLaundry = Task(name: "Do Laundry", notes: "Darks", due: NSDate(timeIntervalSinceNow: 60*60*24))
        
        return [makeBreakfast, goRunning, doLaundry]
    }
    
    func completedTasks(task: Task) {
        task.isComplete = !task.isComplete.boolValue
    }
    
    func incompletedTasks(task: Task) {
        task.isComplete.boolValue
    }
    
    func addTask(name: String, notes: String?, due: NSDate?) {
        
    }
    
    func removeTask(task: Task) {
        
    }
    
    func updateTask(task: Task, name: String, notes: String?, due: NSDate?, isComplete: Bool) {
        
    }
    
    func saveToPersistentStore() {
        
    }
    
    func fetchTasks() -> [Task] {
        return mockTasks
    }
}


