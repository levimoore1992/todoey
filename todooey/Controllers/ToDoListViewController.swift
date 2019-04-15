//
//  ViewController.swift
//  todooey
//
//  Created by Levi Moore on 4/12/19.
//  Copyright © 2019 Levi Moore. All rights reserved.
//

import UIKit


class ToDoListViewController: UITableViewController {

    var itemArray = [Item]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem1 = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [Item] {
            itemArray = items
        }
        
    }
    //-----
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    //------
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done == true ? .checkmark : .none
        
        
        return cell
    }
    
    //-----
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = itemArray[indexPath.row].done
        

        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //----
    @IBAction func addButtonPressed(_ sender: Any) {
        
        var textField = UITextField()
        
        let alert  = UIAlertController(title: "Add new Todooey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "add item", style: .default) { (action) in
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "create new item"
            textField = alertTextField
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
}

