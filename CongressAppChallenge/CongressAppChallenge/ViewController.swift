//
//  ViewController.swift
//  CongressAppChallenge
//
//  Created by Emmett Shaughnessy on 10/16/19.
//  Copyright © 2019 Emmett Shaughnessy. All rights reserved.
//

import UIKit
var NewUserCreation = true

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sets variables created in the "Extra Code" page to equal Array items...
        //We do this here because by the time the user reaches this page, we will definatley know who they are in our system. We will write code to catch possible errors later on...
        UName = UserList[0].UserName!
        UserID = UserList[0].UID!
        UserPassword = UserList[0].Pass!
        
        //Sets the name label to include the current user's name
        Name.text = "Name (\(UName)):"
        UID.text = "User ID (\(UserID))"
        
        //Checking to see if the user is logged in. By the way, the if statement defaults to true if we don't fill out the rest (if UserLoggedIn = true...)
        if UserIsLoggedIn {
            //Running the above code again to update our on-screen data
            Name.text = "Name (\(UName)):"
            UID.text = "User ID (\(UserID))"
            
            UName = UserList[0].UserName!
            UserID = UserList[0].UID!
            UserPassword = UserList[0].Pass!
            
            print("Logged In. Let's go on...")
            
        }else if UserIsLoggedIn == false{
            
            print("Continue with our code below")
        }
        
    }

    //With the next two lines (@IBOutlet) we are simply connecting our User Interface elements to our code. This does nothing in particular besides let us access UI elements throught the code later on
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var UID: UILabel!
    
    //Each @IBAction is a method which is called when you press the corresponding buttons
    @IBAction func nameEdit(_ sender: Any) {
    }
    
    @IBAction func UIDEdit(_ sender: Any) {
    }
    
    @IBAction func PassEdit(_ sender: Any) {
    }
    
    @IBAction func LoginUser(_ sender: Any) {
        NewUserCreation = false
        performSegue(withIdentifier: "NewUser", sender: self)
    }
    
    @IBAction func NewUser(_ sender: Any) {
        //Takes the current user to the "New User" page
        NewUserCreation = true
        performSegue(withIdentifier: "NewUser", sender: self)
    }
    
    @IBAction func GoToLists(_ sender: Any) {
        NewUserCreation = true
        performSegue(withIdentifier: "GoToLists", sender: self)
    }
    

    
}

