//
//  ProfileViewController.swift
//  Inbox-TechJobs
//
//  Created by Ronin Cunningham on 2019-01-26.
//  Copyright © 2019 Ronin Cunningham. All rights reserved.
//

import UIKit

class ProfileViewController : UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet var profilePicture: UIImageView!
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var descriptionText: UITextView!
    @IBAction func importImage(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            userImage.image = image
            //PROFILE IMAGE GLOBALLY CHANGES, AND IN PROFILE TAB, AND IN INBOX TAB
            // UPLOAD IMAGE TO DATABASE???
        } else {
            //Error message
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        profilePicture.image = UIImage(imageLiteralResourceName: "icons8-name-90")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //dismisses keyboard
        descriptionText.resignFirstResponder()
        
    }
    
    
}
