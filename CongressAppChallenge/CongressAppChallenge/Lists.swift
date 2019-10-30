//
//  Lists.swift
//  CongressAppChallenge
//
//  Created by Emmett Shaughnessy on 10/22/19.
//  Copyright © 2019 Emmett Shaughnessy. All rights reserved.
//

import UIKit

class Lists: UITableViewController{
 
    var superUser = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let UID = UserID
            
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let NumberOfRows:Int?
        
        NumberOfRows = ListCount()
        
        return NumberOfRows!
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        
        
        let CurrentID = UID
        let ListsFiltered = ReminderList.filter{$0.UID == CurrentID}
        let ListNames:String = ListsFiltered[indexPath.row].ListName!
        print(ListNames)

        cell.textLabel?.text = ListNames
        print("hello")
        return cell
        
    }
    
    @IBAction func AddList(_ sender: Any) {
        let alert = UIAlertController(title: "Add Lists", message: "Add a new reminder list", preferredStyle: .alert)

        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "List Name"
        })
        
        
        
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { action in

            if let name = alert.textFields?.first?.text {
               //Takes textField input and adds a new list to our Array
                ReminderList.append(ReminderLists(ListName: name, UID: UID))
                self.tableView.reloadData()
            }
        }))
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    func ListCount() -> Int{
        
        let CurrentID = CurrentUID
        
        let ListsFiltered = ReminderList.filter{$0.UID == CurrentID}
        
        return ListsFiltered.count
    }
    



}
