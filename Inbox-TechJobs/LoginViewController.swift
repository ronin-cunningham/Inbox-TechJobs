//
//  LoginViewController.swift
//  Inbox-TechJobs
//
//  Created by Ronin Cunningham on 2019-01-26.
//  Copyright © 2019 Ronin Cunningham. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class LoginViewController : UIViewController {
    
    @IBOutlet weak var _email: UITextField!
    
//    override func viewWillAppear(_ animated: Bool) {
//        //PUT LISTENER
//    }
//    @IBOutlet var _username: UITextField!
    
    @IBOutlet var _password: UITextField!
    
//    @IBOutlet var _login_button: UIButton!

    
    override func viewDidLoad() {
        //LOAD BACKGROUND
        let backgroundImage = UIImage.init(named: "background")
        let blackImage = UIImage.init(named: "black")
        
        let ref = Database.database().reference()
        let employeeRef = ref.child("Employees")
        
        employeeRef.child("-LXhTxFdKae1ks0uJc8t").updateChildValues(["yeet": "yeet"])
        
        
        Helper.instBackground(view1: self.view, bckgr: backgroundImage!, alph: 0.8)
        Helper.instBackground(view1: self.view, bckgr: blackImage!, alph: 0.9)
        
    }
    
    
//    @IBAction func loginButtonTapped(_ sender: Any) {
//        //form validation on email and password
//        if let email = _email.text, let pass = _password.text {
//            Auth.auth().signIn(withEmail: email, link: pass) { (user, error) in
//                //check that user isn't nil
//                if let u = user {
//                    self.shouldPerformSegue(withIdentifier: "goToHome", sender: self)
//                } else {
//                    //ERROR: check error SHOW MESSAGE
//                }
//
//            }
//        }
//
//    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        if let email = _email.text, let pass = _password.text {
            Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
                //check that user isn't nil
                if user == nil {
                    //THROW ERROR
                }
                
                //KEEP HERE FOR LEGACY PURPOSES
//                if user != nil {
//                    self.performSegue(withIdentifier: "goToHome", sender: self)
//                } else {
//                    //ERROR: check error SHOW MESSAGE
//                }
                
            }
        }
    }
    
    
    
}
