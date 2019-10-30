//
//  ExtraCode.swift
//  CongressAppChallenge
//
//  Created by Emmett Shaughnessy on 10/16/19.
//  Copyright © 2019 Emmett Shaughnessy. All rights reserved.
//

import Foundation

var UName:String?
var UserID:String?



//We will use this in another file to check if the user is logged in. We'll set the default to "false" just to be safe (we don't want other users accessing other people's content).
var UserIsLoggedIn = false


//Defining parameters to be used in our Array
struct UserItems{
    
    var UserName:String?
    var UID:Int?
    var Pass:String?
    
}

struct ReminderLists {
    var ListName:String?
    var UID:Int?
}



//Array that defines our list of Users. As we update this by adding new users throught the app, the code won't update so we'll build another way to access our User List. Notice how the parameters defined above are used here when we call our Array...

var ReminderList = [

    ReminderLists(ListName: "Name", UID: 0001)
    
]
