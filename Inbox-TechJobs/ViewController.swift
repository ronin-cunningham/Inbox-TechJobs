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
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    
    
    
    @IBOutlet var previewCardImageView: UIImageView!
    @IBOutlet var cardView: UIView!
    
    @IBOutlet var cardImageView: UIImageView!
    
    @IBOutlet var yesnoImageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        divisor = (view.frame.width/2)/0.61
        
        card = cardImageArray[0] //DATABASE


        previewCard = cardImageArray[1] //DATABASE
        
        
        cardImageView.image = UIImage(named: card)//RANDOMIZE THIS
        previewCardImageView.image = UIImage(named: previewCard)//RANDOMIZE THIS AS WELL
        
        cardView.layer.cornerRadius = 15.0
        cardView.clipsToBounds = true
        
        previewCardImageView.layer.cornerRadius = 15.0
        previewCardImageView.clipsToBounds = true
        self.tabBarController?.navigationItem.hidesBackButton = true
        nameLabel.text = card
        positionLabel.text = positionArray[0]
        locationLabel.text = locationArray[0]
        departmentLabel.text = departmentArray[0]
        
    }
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        card.translatesAutoresizingMaskIntoConstraints = true ////TEMPORARY FIX
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        card.center = CGPoint(x: view.center.x + point.x, y: (view.center.y) + point.y)
        
        
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
                card.center = CGPoint(x: self.view.center.x, y: (self.view.center.y))
                self.yesnoImageView.alpha = 0
                card.transform = CGAffineTransform.identity
            })
        }
    }
    
    
//FIND HARD CODED STUFF
    func findCard(x: [String]) -> String {
        let randIndex = Int(arc4random_uniform(UInt32(x.count)))
        let card = x[randIndex]
        departmentLabel.text = departmentArray[randIndex]
        locationLabel.text = locationArray[randIndex]
        positionLabel.text = positionArray[randIndex]
        return card
    }
    
    func resetCard() {
        
        let bufferTime = 0.25
        DispatchQueue.main.asyncAfter(deadline: .now() + bufferTime, execute: {
            self.card = self.previewCard
            self.nameLabel.text = self.card
                
            self.previewCard = self.findCard(x: cardImageArray)
            
            
            /*
            self.card = self.previewCard
            
            self.previewCard = "" //DATABASE
            */
            
            self.cardImageView.image = UIImage(named: self.card)
            self.previewCardImageView.image = UIImage(named: self.previewCard)
            
            self.yesnoImageView.alpha = 0
            self.cardView.transform = CGAffineTransform.identity
            self.cardView.center = CGPoint(x: self.view.center.x, y: (self.view.center.y))
            self.cardView.alpha = 1
            })
        
        
        
            
        
            
        }
        
    

}

