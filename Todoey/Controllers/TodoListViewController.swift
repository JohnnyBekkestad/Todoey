//
//  ViewController.swift
//  Todoey
//
//  Created by Johnny Bekkestad on 7/1/19.
//  Copyright © 2019 Johnny Bekkestad. All rights reserved.
//

import UIKit


class TodoListViewController: UITableViewController {

//    var itemArray = ["Find Mike", "Buy Eggs", "Destroy Demogorgon"]
    var itemArray: [Item] = []
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let items = defaults.object(forKey: "ToDoListArray") as? Data  {
            let decoder = JSONDecoder()
            if let item = try? decoder.decode(Item.self, from: items) {
                itemArray.append(item)
            }
        }
    }
    
    //MARK - Table View DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Set number of rows
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = itemArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = item.title
        cell.accessoryType = item.selected ? .checkmark : .none
        return cell
    }
    
    //MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].selected = !itemArray[indexPath.row].selected
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add new Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var localTextField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What will happend once the User clicks the Add Item Button on our UIAlert
            let item : Item = Item(name: localTextField.text!)
            self.itemArray.append(item)
            
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(self.itemArray) {
                self.defaults.set(encoded, forKey: "TodoListArray")
            }
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            localTextField = alertTextField
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}

