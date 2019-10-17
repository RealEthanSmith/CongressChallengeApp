//
//  NewUserPage.swift
//  CongressAppChallenge
//
//  Created by Emmett Shaughnessy on 10/16/19.
//  Copyright © 2019 Emmett Shaughnessy. All rights reserved.
//

import UIKit

class NewUserPage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var PassField: UITextField!
    
    @IBAction func NewUserPressed(_ sender: Any) {
        UserList.append(UserItems(UserName: NameField.text, UID: <#T##Int?#>, Pass: PassField.text))
    }
    
    
    

}
