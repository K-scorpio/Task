//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Kevin Hartley on 5/25/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    var task: Task?
    
    var dueDateValue: NSDate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dueDate.inputView = dueDatePicker
        if let task = task {
            updateWithTask(task)
        }
    }
    
    //MARK: - IBOutlets

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dueDate: UITextField!
    @IBOutlet weak var bodyTextField: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    
    //MARK: - IBActions

    @IBAction func saveButtonTapped(sender: AnyObject) {
         updateTask()
        TaskController.sharedInstance.saveToPersistentStore()
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
         navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func datePicker(sender: UIDatePicker) {
        self.dueDate.text = sender.date.stringValue()
        self.dueDateValue = sender.date
    }

    
    @IBAction func userTapped(sender: AnyObject) {
        self.titleTextField.resignFirstResponder()
        self.dueDate.resignFirstResponder()
        self.bodyTextField.resignFirstResponder()
    }
    
    func updateTask() {
        
        guard let name = titleTextField.text else {return}
        let due = dueDateValue
        let notes = bodyTextField.text
        
        if let task = self.task {
            TaskController.sharedInstance.updateTask(task, name: name, notes: notes, due: due, isComplete: true)
        } else {
            TaskController.sharedInstance.addTask(name, notes: notes, due: due)
        }
    }
    
    func updateWithTask(task: Task) {
        self.task = task
        
        title = task.name
        titleTextField.text = task.name
        
        if let due = task.due {
            dueDate.text = due.stringValue()
        }
        
        if let notes = task.notes {
            bodyTextField.text = notes
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 3
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 1
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
