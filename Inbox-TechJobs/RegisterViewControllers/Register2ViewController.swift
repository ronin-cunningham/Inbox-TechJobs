//
//  Register2ViewController.swift
//  Inbox-TechJobs
//
//  Created by Ronin Cunningham on 2019-01-27.
//  Copyright © 2019 Ronin Cunningham. All rights reserved.
//

import UIKit
import Firebase

class Register2ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var _education: UITextField!
    @IBOutlet weak var _positionPicker: UIPickerView!
    
    @IBOutlet weak var _locationPicker: UIPickerView!
    
    @IBOutlet weak var _isMentor: UISwitch!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var _userImage: UIImageView!
    
    let ref = Database.database().reference()
    let employeeRef = Database.database().reference().child("Employees")
    
    
    @IBAction func nextButtonAction(_ sender: Any) {
        if let education = _education.text, let image = _userImage.image {
            guard let employeeID = Auth.auth().currentUser?.uid else {return}
            
            employeeRef.child(employeeID).updateChildValues(["education": education])
            
        }
    }
    
    @IBAction func importImage(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true)
    }
    
    func uploadImageToFirebaseStorage(data: NSData) {
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            _userImage.image = image
            //PROFILE IMAGE GLOBALLY CHANGES, AND IN PROFILE TAB, AND IN INBOX TAB
            // UPLOAD IMAGE TO DATABASE???
        } else {
            //Error message
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    let depts = ["Customer Service", "Marketing", "Finance", "Operation", "Network Security", "Logistics", "Management"]
    
    let positions = ["Middle-level Management", "Intern", "Co-op", "Senior", "First Level Management", "Executive"]
    
    let locations = ["Burnaby", "Toronto", "Montreal"]
    
    func numberOfComponents(in departmentPicker: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ departmentPicker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return depts[row]
    }
    
    func pickerView(_ departmentPicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return depts.count
    }
    
    
    
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

}
