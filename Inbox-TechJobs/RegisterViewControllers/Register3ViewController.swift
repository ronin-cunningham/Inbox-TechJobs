//
//  Register3ViewController.swift
//  Inbox-TechJobs
//
//  Created by Ronin Cunningham on 2019-01-27.
//  Copyright © 2019 Ronin Cunningham. All rights reserved.
//

import UIKit


class Register3ViewController: UIViewController {
    
    @IBOutlet weak var monday: UISwitch!
    @IBOutlet weak var tuesday: UISwitch!
    @IBOutlet weak var wednesday: UISwitch!
    @IBOutlet weak var thursday: UISwitch!
    @IBOutlet weak var friday: UISwitch!
    @IBOutlet weak var saturday: UISwitch!
    @IBOutlet weak var sunday: UISwitch!
    
    @IBOutlet weak var tellMeAboutYourself: UITextField!
    //
//    let degrees = ["Computer Science", "Computer Engineering", "Software Engineering", "MBA"]
//    let travelDistance = ["10km", "20km", "30km", "40km", "50km"]
//
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
//
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//
//        return degrees.count
//
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return degrees[row]
//
//    }
//
    
    
    @IBAction func doneTapped(_ sender: UIButton) {
        
        
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
