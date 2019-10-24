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
        
        CurrentUID = 0001
            
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let NumberOfRows:Int?
        
        NumberOfRows = ListCount()
        
        return NumberOfRows!
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        
        
        let CurrentID = CurrentUID
        let ListsFiltered = ReminderList.filter{$0.UID == CurrentID}
        let ListNames:String = ListsFiltered[indexPath.row].ListName!
        print(ListNames)

        cell.textLabel?.text = "hello"
        print("hello")
        return cell
        
    }
    
    
    
    
    func ListCount() -> Int{
        
        let CurrentID = CurrentUID
        
        let ListsFiltered = ReminderList.filter{$0.UID == CurrentID}
        
        return ListsFiltered.count
    }
    



}
