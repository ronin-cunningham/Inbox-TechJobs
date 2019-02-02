//
//  ViewController.swift
//  Inbox-TechJobs
//
//  Created by Ronin Cunningham on 2019-01-26.
//  Copyright © 2019 Ronin Cunningham. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    var divisor: CGFloat!
    
    var card: String = ""
    var previewCard: String = ""
    
    @IBOutlet weak var userTestLabel: UILabel!
    
    let cardImageArray = ["Sean Lee","Nicole Pitre"]
    
    @IBOutlet var previewCardImageView: UIImageView!
    @IBOutlet var cardView: UIView!
    
    @IBOutlet var cardImageView: UIImageView!
    
    @IBOutlet var yesnoImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        divisor = (view.frame.width/2)/0.61
        
        
        card = "Sean Lee" //DATABASE


        previewCard = "Nicole Pitre" //DATABASE
        
        
        cardImageView.image = UIImage(named: card)//RANDOMIZE THIS
        previewCardImageView.image = UIImage(named: previewCard)//RANDOMIZE THIS AS WELL
        
        cardView.layer.cornerRadius = 15.0
        cardView.clipsToBounds = true
        
        previewCardImageView.layer.cornerRadius = 15.0
        previewCardImageView.clipsToBounds = true
        self.tabBarController?.navigationItem.hidesBackButton = true
    }
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        card.translatesAutoresizingMaskIntoConstraints = true ////TEMPORARY FIX
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        card.center = CGPoint(x: view.center.x + point.x, y: (view.center.y * 1.18) + point.y)
        
        
        let scale = min(100/abs(xFromCenter), 1)
        card.transform = CGAffineTransform(rotationAngle: xFromCenter/divisor).scaledBy(x: scale, y: scale)
        
        if xFromCenter >= 0 {
            yesnoImageView.image = UIImage(named: "no")
        }
        
        if xFromCenter <= 0 {
            yesnoImageView.image = UIImage(named: "yes")
        }
        
        yesnoImageView.alpha = abs(xFromCenter)/view.center.x
        
        //if person changes their mind and switches sides, this code makes it so that it still plays the water drop sound on other side without having to let go
        
        
        if sender.state == UIGestureRecognizer.State.ended{
            if card.center.x < 75{
                //move off to left
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                    card.alpha = 0
                    
                })
                resetCard()
                
                return
            }else if card.center.x > (view.frame.width - 75){
                //move off to right
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                    card.alpha = 0
                })
                resetCard()
                
                return
            }
            UIView.animate(withDuration: 0.2, animations: {
                card.center = CGPoint(x: self.view.center.x, y: (self.view.center.y * 1.18))
                self.yesnoImageView.alpha = 0
                card.transform = CGAffineTransform.identity
            })
        }
    }
    
    
    func resetCard() {
        
        let bufferTime = 0.25
        DispatchQueue.main.asyncAfter(deadline: .now() + bufferTime, execute: {
            var temp = self.card //temp to rotate DELETE IN REAL VERSION
            self.card = self.previewCard
            
            
            self.previewCard = temp //DATABASE //temp to rotate DELETE IN REAL VERSION
            
            /*
            self.card = self.previewCard
            
            self.previewCard = "" //DATABASE
            */
            
            self.cardImageView.image = UIImage(named: self.card)
            self.previewCardImageView.image = UIImage(named: self.previewCard)
            
            self.yesnoImageView.alpha = 0
            self.cardView.transform = CGAffineTransform.identity
            self.cardView.center = CGPoint(x: self.view.center.x, y: (self.view.center.y * 1.18))
            self.cardView.alpha = 1
            })
            
        
            
        }
        
    

}

