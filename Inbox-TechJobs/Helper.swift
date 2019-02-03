//
//  Helper.swift
//  Inbox-TechJobs
//
//  Created by Ronin Cunningham on 2019-01-26.
//  Copyright © 2019 Ronin Cunningham. All rights reserved.
//

import UIKit
let cardImageArray = ["Sean Lee","Nicole Pitre"]

class Helper{
    static func instBackground(view1 : UIView, bckgr : UIImage, alph : CGFloat) {
        let backgroundImageView = UIImageView.init(frame: view1.frame)
        backgroundImageView.image = bckgr
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.alpha = alph
        view1.insertSubview(backgroundImageView, at: 0)
    }
}
