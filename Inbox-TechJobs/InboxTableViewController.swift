//
//  InboxTableViewController.swift
//  Inbox-TechJobs
//
//  Created by Ronin Cunningham on 2019-01-26.
//  Copyright © 2019 Ronin Cunningham. All rights reserved.
//

import UIKit
import Firebase




var connectedUsers = ["Nicole Pitre","Sean Lee"]
var userDesc = ["I'm grateful to be part of Paddle, one of the UK's fastest growing software companies (5th this year in the Deloitte Fast 50). Our mission is to help software businesses succeed - enabling them to focus on creating products the world loves. If you'd like to learn more about our platform, vision or open roles, drop me a message here or at nicole@paddle.com.", "Proud to play a small role in advancing Canada and Israel as a non-profit professional since 2007."]
var userImages: [UIImage] = [UIImage(imageLiteralResourceName: "Nicole Pitre"), UIImage(imageLiteralResourceName: "Sean Lee")] //image literal
var myIndex = 0

class InboxTableViewController: UITableViewController {



    // MARK: - Table view data source
    func handleUpdatingBios() {
        let ref = Database.database().reference()
        let employeeRef = ref.child("Employees")
        
        employeeRef.child(uid!).observeSingleEvent(of: .value) { (snapshot) in
            if let bioData = snapshot.value as? [String:Any] {
                let firstName = bioData["firstName"] as? String ?? ""
                let lastName = bioData["lastName"] as? String ?? ""
                connectedUsers.append(firstName)
                connectedUsers.append(lastName)
            }
        }
        
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return connectedUsers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = connectedUsers[indexPath.row]
        cell.imageView?.image = userImages[indexPath.row]
//        cell.imageView
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }

   

}
