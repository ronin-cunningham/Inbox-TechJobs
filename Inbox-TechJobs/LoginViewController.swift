//
//  LoginViewController.swift
//  Inbox-TechJobs
//
//  Created by Ronin Cunningham on 2019-01-26.
//  Copyright © 2019 Ronin Cunningham. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController : UIViewController {
    
    
    
    @IBOutlet var _username: UITextField!
    
    @IBOutlet var _password: UITextField!
    
    @IBOutlet var _login_button: UIButton!
    
    
    @IBAction func LoginButton(_ sender: Any) {
        let username = _username.text
        let password = _password.text
        
        
        if (username == "" || password == "") {
            return
        }
        
   
    }

    
    override func viewDidLoad() {
        //LOAD BACKGROUND
        let backgroundImage = UIImage.init(named: "background")
        let blackImage = UIImage.init(named: "black")
        
        Helper.instBackground(view1: self.view, bckgr: backgroundImage!, alph: 0.8)
        Helper.instBackground(view1: self.view, bckgr: blackImage!, alph: 0.9)
        
    }
    
    
    
    
}
