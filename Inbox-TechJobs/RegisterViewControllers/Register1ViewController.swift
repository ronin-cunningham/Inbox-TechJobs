//
//  Register1ViewController.swift
//  Inbox-TechJobs
//
//  Created by Ronin Cunningham on 2019-01-27.
//  Copyright © 2019 Ronin Cunningham. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class Register1ViewController: UIViewController {

    @IBOutlet weak var _firstName: UITextField!
    @IBOutlet weak var _lastName: UITextField!
    @IBOutlet weak var _email: UITextField!
    @IBOutlet weak var _password: UITextField!
    @IBOutlet weak var _reEnterPassword: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nextButton.layer.cornerRadius = 10
        nextButton.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //REGISTERS USER IN FIREBASE AUTH EMAIL AND LOGIN
    @IBAction func nextTapped(_ sender: UIButton) {
        if let email = _email.text, let password = _password.text, let reEnterPassword = _reEnterPassword.text {
            if (password == reEnterPassword) {
                Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                    //check that user is not nil
                    
                    if user != nil {
                        //GO TO NEXT PAGE
                        self.performSegue(withIdentifier: "accountCreationNextSegue", sender: self)
                    } else {
                        //THROW ERROR
                    }
                }
            }
        }
    }
    
}
