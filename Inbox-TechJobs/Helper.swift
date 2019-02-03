//
//  Helper.swift
//  Inbox-TechJobs
//
//  Created by Ronin Cunningham on 2019-01-26.
//  Copyright © 2019 Ronin Cunningham. All rights reserved.
//

import UIKit


let positionArray = ["Senior", "Executive", "Management", "Lead Designer", "Senior designer", "Tester"]
let departmentArray = ["Customer Service", "Finance", "Human Resources", "Logistics", "Information Technology", "Software Development"]
let locationArray = ["Burnaby", "Vancouver", "Toronto", "Montreal", "Palo Alto", "Los Angeles"]
let cardImageArray = ["Sean Lee","Nicole Pitre", "Adam Grant", "Jack Goodman", "Jacob Cunningham", "John Smith"]

var userDesc = ["I'm grateful to be part of Paddle, one of the UK's fastest growing software companies (5th this year in the Deloitte Fast 50). Our mission is to help software businesses succeed - enabling them to focus on creating products the world loves. If you'd like to learn more about our platform, vision or open roles, drop me a message here or at nicole@paddle.com.", "Proud to play a small role in advancing Canada and Israel as a non-profit professional since 2007.", "", "", ""]
var userImages: [UIImage] = [UIImage(imageLiteralResourceName: "Sean Lee"), UIImage(imageLiteralResourceName: "Nicole Pitre"), UIImage(imageLiteralResourceName: "Adam Grant"), UIImage(imageLiteralResourceName: "Jack Goodman"), UIImage(imageLiteralResourceName: "Jacob Cunningham"), UIImage(imageLiteralResourceName: "John Smith")] //image literal
var myIndex = 0

class Helper {
    static func instBackground(view1 : UIView, bckgr : UIImage, alph : CGFloat) {
        let backgroundImageView = UIImageView.init(frame: view1.frame)
        backgroundImageView.image = bckgr
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.alpha = alph
        view1.insertSubview(backgroundImageView, at: 0)
    }
    
    
}
