//
//  NewUserPage.swift
//  CongressAppChallenge
//
//  Created by Emmett Shaughnessy on 10/16/19.
//  Copyright © 2019 Emmett Shaughnessy. All rights reserved.
//

import UIKit

class NewUserPage: UIViewController {
    var LoginUser = false

    //This code runs the second that the user can see this specific screen
    override func viewDidLoad() {
        super.viewDidLoad()
        //If the user needs to create an account, the screen will say "New User". if the user is trying to login, the screen will say "Login"
        if NewUserCreation == true{
            ScreenTitle.text = "New User"
            NewUserButton.titleLabel?.text = "Create User"
            LoginUser = false
        } else if NewUserCreation == false{
            ScreenTitle.text = "Login"
            NewUserButton.titleLabel?.text = "Login"
            LoginUser = true
        }
        
    }
    
    
    @IBOutlet weak var ScreenTitle: UILabel!
    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var PassField: UITextField!
    @IBOutlet weak var NewUserButton: UIButton!
    
    @IBAction func NewUserPressed(_ sender: Any) {
        if LoginUser == false{
            UserList.append(UserItems(UserName: NameField.text, UID: UserID+1, Pass: PassField.text))
            
            //Updating our current user info
            CurrentUName = NameField.text
            CurrentUID = UserID+1
            CurrentUPass = PassField.text
            
            //Officially updating the UID
            UserID = UserID+1
            
            print("\(UserList)\n\n")
            print("Highest UID: \(UserID)")
            
        } else if LoginUser == true{
            
             if AdminUserSeeingList(){
                CurrentUserIsSuper = true
                print("Super user active")
            }
            
            
            
            let userFound = LoginAUser(UserName: NameField.text!, Password: PassField.text!)
            
            if userFound == true {
                //Getting user info
                let UsersFiltered = UserList.filter{$0.UserName == NameField.text}

                //Comparing the password from the user to the one stored in our system
                if PassField.text == UsersFiltered[0].Pass{
                    //Updating our current user info
                    CurrentUName = UsersFiltered[0].UserName
                    CurrentUID = UsersFiltered[0].UID
                    CurrentUPass = UsersFiltered[0].Pass
                    
                } else {
                    print("uh oh")
                }
            } else if userFound == false{
                
            }
            
        }
    }
    
    //A cool function that we'll use so that we can see how many users are in our app. This is not a good way of doing so, therefore as our app grows in popularity we will eventually change how we do this. For now it will do just fine for our purposes.
    func AdminUserSeeingList() -> Bool{
        if NameField.text == "SuperAdminUserWantsToSeeOthers" && PassField.text == "SUPEROurAppForCongressADMIN"{
            return true
        } else {
            return false
        }
    }
    
    
    
    
     //This function helps us find a user within our User list. This is too complicated too fully explain here, but pay attention to how it is used in the code above and ask more about it in class
    func LoginAUser(UserName: String, Password: String) -> Bool{
        let found = UserList.filter{$0.UserName == UserName}.count > 0
        let UsersFiltered = UserList.filter{$0.UserName == UserName}
        
        if found {
            print("User Found")
           //let UserIndex = UsersFiltered[0].UID
            //print(UserIndex!)
            return found
        } else if found == false{
            print("User Not Found")
            return found
            //Our error code is 0 since there is no user with a UID of 0. If our code receives 0, it knows that no user was found with that user name
        } else {
            return false
        }
    }

    
    

}
