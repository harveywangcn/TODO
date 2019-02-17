//
//  ViewController.swift
//  TODO
//
//  Created by Harvey Wang on 2019/2/17.
//  Copyright © 2019 Harvey Wang. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var itemArray = [" 购买水杯 "," 吃药 "," 修改密码 "]

    //MARK: - Table View DataSource methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //MARK: - Table View Delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.row)
        print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        } else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    @IBAction func addButtonItem(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: " 添加一个新的ToDo项目 ", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: " 添加项目 ", style: .default) { (action) in
            // user click + then run code as below
            //print("成功!")
            print(textField.text!)
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "创建一个新项目..."
            //print(alertTextField.text!)
            textField = alertTextField
            
        }
            
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    
    }
    
}

