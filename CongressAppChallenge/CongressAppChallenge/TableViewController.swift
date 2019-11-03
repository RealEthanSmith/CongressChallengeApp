//
//  TableViewController.swift
//  CongressAppChallenge
//
//  Created by Emmett Shaughnessy on 10/31/19.
//  Copyright © 2019 Emmett Shaughnessy. All rights reserved.
//

import Foundation
import UIKit
import Firebase


class TableViewController: UITableViewController {

    var DocRef: DocumentReference!
    var db:Firestore!
    var listArray = [ReminderLists]()
    var email:String?
    var tableuserid:String?
    var testList = [Any]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        email = (Auth.auth().currentUser?.email!)!
        tableuserid = Auth.auth().currentUser!.uid
        
        db = Firestore.firestore()
        print("hey")
        otherLoadData()
        checkForUpdates()

    }
    
    func loadData() {
        //Grabs Lists (documents) from Firestore
        db.collection("users").document(self.tableuserid!).collection("lists").getDocuments(){
            querySnapshot, error in
            if let error = error{
                print("Error loading: \(error.localizedDescription)")
            } else {
                print("Getting Documents")
                self.listArray = querySnapshot!.documents.compactMap({ReminderLists(dictionary: $0.data())})
                DispatchQueue.main.async {
                    print("Here you go!")
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func otherLoadData(){
        let docRef = db.collection("users").document(self.tableuserid!).collection("lists")

        db.collection("users").document(self.tableuserid!).collection("lists")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        self.listArray = querySnapshot!.documents.compactMap({ReminderLists(dictionary: $0.data())})
                        DispatchQueue.main.async {
                            print("Here you go!")
                            self.tableView.reloadData()
                        }
                    }
                }
        }
    }
    
    func checkForUpdates(){
        db.collection("users").document(self.tableuserid!).collection("lists").whereField("timeStamp", isGreaterThan: Date()).addSnapshotListener {
            querySnapshot, error in
            
            guard let snapshot = querySnapshot else {return}
            
            snapshot.documentChanges.forEach {
                diff in
                
                if diff.type == .added {
                    self.listArray.append(ReminderLists(dictionary: diff.document.data())!)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                
            }
        }
    }
    
//    func defaultCheckForUpdates(){
//        db.collection("users").document(self.tableuserid!).collection("lists").whereField("timeStamp", isGreaterThan: Date()).addSnapshotListener { querySnapshot, error in
//            guard let documents = querySnapshot?.documents else {
//                print("Error fetching documents: \(error!)")
//                return
//            }
//            let data = documents.map { $0["ListName"] }
//            self.listArray.append(ReminderLists(ListName: data, timeStamp: <#T##Date?#>))
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
//    }
    
    
     
    @IBAction func addList(_ sender: Any) {
        let alert = UIAlertController(title: "List Name", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "New List Name Goes Here"
        })

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            guard let ListName = alert.textFields?.first?.text!, !ListName.isEmpty else {return}
            
            let NewList = ReminderLists(ListName: ListName, timeStamp: Date())
            var ref:DocumentReference? = nil
            ref = self.db.collection("users").document("\(self.tableuserid!)").collection("lists").addDocument(data: NewList.dictionary){
                error in
                if let error = error{
                    print("Error adding document: \(error.localizedDescription)")
                } else {
                    print("Data Saved with ID: \(ref!.documentID)")
                }
            }
            
            self.loadData()
            
        }))

        self.present(alert, animated: true)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return listArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)

        let list = listArray[indexPath.row]
        
        cell.textLabel?.text = "\(list.ListName) hey"

        return cell
    }
    


    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return false
    }
    
    
    
    
    

}
