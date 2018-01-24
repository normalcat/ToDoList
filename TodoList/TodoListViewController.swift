//
//  ViewController.swift
//  TodoList
//
//  Created by Chao-I Chen on 1/21/18.
//  Copyright © 2018 Chao-I Chen. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController, SubmitAddThingDelegate {

    var items = [TodoList]()
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func itemSubmit(by controller: AddThingViewController, with text: String, with note: String, and date: Date) {
        let newItem = NSEntityDescription.insertNewObject(forEntityName: "TodoList", into: managedObjectContext) as! TodoList
        newItem.title = text
        newItem.date = date
        newItem.note = note
        items.append(newItem)
        do{
            try managedObjectContext.save()
        }catch{
            print(error)
        }
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomeCell", for: indexPath) as! MyTableViewCell
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        cell.titleLabel?.text = items[indexPath.row].title
        //cell.dateLabel?.text = String(describing: items[indexPath.row].date)
        cell.dateLabel?.text = formatter.string(from: items[indexPath.row].date!)
        cell.noteLabel?.text = items[indexPath.row].note
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! AddThingViewController
        
        destination.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        }
    }
    
    func fetchAllItems(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "TodoList")
        do{
            let result = try managedObjectContext.fetch(request)
            items = result as! [TodoList]
            print(items.count)
        }catch{
            print(error)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

}

