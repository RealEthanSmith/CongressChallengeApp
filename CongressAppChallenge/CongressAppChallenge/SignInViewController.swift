//
//  SignInViewController.swift
//  CongressAppChallenge
//
//  Created by Emmett Shaughnessy on 10/26/19.
//  Copyright © 2019 Emmett Shaughnessy. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class SignInViewController: UIViewController, GIDSignInDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
        
    }
    
    @IBOutlet weak var GoogleSignIn: GIDSignInButton!
    
    //In the signIn:didSignInForUser:withError: method, get a Google ID token and Google access token from the GIDAuthentication object and exchange them for a Firebase credential:
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
      // ...
      if let error = error {
        print(error)
        print("Error here")
        return
      }
      print("Code is runnig well")

      guard let authentication = user.authentication else { return }
      let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                     accessToken: authentication.accessToken);
        
      Auth.auth().signIn(with: credential) { (authResult, error) in
        if let error = error {
          print(error)
            print("hey")
            
          return
        }
        // User is signed in
        print("user signed in")
      }
    }
    
    
    
    
    
    
    
    
    @IBOutlet weak var SignOut: UIButton!
    @IBAction func SignOutUser(_ sender: Any) {
        print("Signing Out...")
            let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
          
    }
    

   

}
