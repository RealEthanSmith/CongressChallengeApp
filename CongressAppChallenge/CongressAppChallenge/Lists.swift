//
//  Lists.swift
//  CongressAppChallenge
//
//  Created by Emmett Shaughnessy on 10/22/19.
//  Copyright © 2019 Emmett Shaughnessy. All rights reserved.
//

import UIKit

class Lists: UITableViewController {
 
    var superUser = false
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        if CurrentUserIsSuper{
            superUser = true
            print("About to run list code...")
            CurrentUserIsSuper = false
            tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let NumberOfRows:Int?
        if superUser{
            NumberOfRows = UserList.count
            print("All Good Here")
            return NumberOfRows!
        }else{
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        
        cell.textLabel?.text = UserList[indexPath.row].UserName
        cell.detailTextLabel?.text = "\(UserList[indexPath.row].UID)"
        
        return cell
        
    }

}
