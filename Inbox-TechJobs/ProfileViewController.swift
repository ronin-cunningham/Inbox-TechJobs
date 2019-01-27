//
//  ProfileViewController.swift
//  Inbox-TechJobs
//
//  Created by Ronin Cunningham on 2019-01-26.
//  Copyright © 2019 Ronin Cunningham. All rights reserved.
//

import UIKit

class ProfileViewController : UIViewController {
    @IBOutlet var profilePicture: UIImageView!
    
    override func viewDidLoad() {
        profilePicture.image = UIImage(imageLiteralResourceName: "icons8-name-90")
    }
    
    
}
