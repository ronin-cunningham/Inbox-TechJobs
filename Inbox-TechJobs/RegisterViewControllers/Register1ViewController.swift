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
    @IBOutlet weak var errorMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorMessage.isHidden = true
        nextButton.layer.cornerRadius = 10
        nextButton.layer.masksToBounds = true
        // Do any additional setup after loading the view.
        }
    
    let ref = Database.database().reference().child("Employees")
    
    
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
        if let email = _email.text, let password = _password.text, let firstName = _firstName.text, let lastName = _lastName.text, let reEnterPassword = _reEnterPassword.text {
            print(email)
            
            if (password == reEnterPassword) {
                Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                
                    //check that user is not nil
                    if user != nil {
                        //GO TO NEXT PAGE
                            self.performSegue(withIdentifier: "accountCreationNextSegue", sender: self)
                    } else {
                        self.errorMessage.isHidden = false
                    }
                    
                }
                
                let ref = Database.database().reference()
                let employeeRef = Database.database().reference().child("Employees")
                
                guard let employeeID = Auth.auth().currentUser?.uid else {return}
                
                employeeRef.child(employeeID).setValue(["email": email, "password": password, "firstName": firstName, "lastName": lastName])
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //dismisses keyboard
        _email.resignFirstResponder()
        _password.resignFirstResponder()
        _firstName.resignFirstResponder()
        _lastName.resignFirstResponder()
        _reEnterPassword.resignFirstResponder()
    }
    
}
