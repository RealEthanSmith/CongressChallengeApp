//
//  ViewController.swift
//  CongressAppChallenge
//
//  Created by Emmett Shaughnessy on 10/16/19.
//  Copyright © 2019 Emmett Shaughnessy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UName = UserList[0].UserName!
        UserID = UserList[0].UID!
        UserPassword = UserList[0].Pass!
        
        Name.text = "Name (\(UName)):"
        
    }

    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var UID: UILabel!
    
    
    @IBAction func nameEdit(_ sender: Any) {
    }
    @IBAction func UIDEdit(_ sender: Any) {
    }
    @IBAction func PassEdit(_ sender: Any) {
    }
    @IBAction func NewUser(_ sender: Any) {
        performSegue(withIdentifier: "NewUser", sender: self)
    }
    
    
    

}

