//
//  InboxSpecificUserViewController.swift
//  Inbox-TechJobs
//
//  Created by Ronin Cunningham on 2019-01-26.
//  Copyright © 2019 Ronin Cunningham. All rights reserved.
//

import UIKit

class InboxSpecificUserViewController: UIViewController {
    
    @IBOutlet var userName: UILabel!
    
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var userDescription: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userName.text = cardImageArray[myIndex]
        userDescription.text = userDesc[myIndex]
        
        //REQUIRES USER'S IMAGE NAME BE THEIR IMAGE FILE NAME
        userImage.image = UIImage(named: cardImageArray[myIndex] + ".jpg")
        
        

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

}
