//
//  ExtraCode.swift
//  CongressAppChallenge
//
//  Created by Emmett Shaughnessy on 10/16/19.
//  Copyright © 2019 Emmett Shaughnessy. All rights reserved.
//

import Foundation
import Firebase

var UName:String?
var UserID:String?
var UserIsLoggedIn:Bool?


struct Items {
    
    var ItemName:String?
    var key:String?
    var addedByuser:Int?
    
}

protocol DocumentSerializable {
    init? (dictionary:[String:Any])
}

struct ReminderLists {
    var ListName:String?
    var timeStamp:Date?
    
    var dictionary:[String:Any] {
        return [
            "listName":ListName,
            "timeStamp":timeStamp
        ]
        
    }
    
}

extension ReminderLists: DocumentSerializable{
    init?(dictionary: [String : Any]) {
        guard let ListName = dictionary["ListName"] as? String,
            let timeStamp = dictionary["timeStamp"] as? Date else {return nil}
        
        ReminderLists.init(ListName: ListName, timeStamp: timeStamp)
        
    }
}
