//
//  InboxTableViewController.swift
//  Inbox-TechJobs
//
//  Created by Ronin Cunningham on 2019-01-26.
//  Copyright © 2019 Ronin Cunningham. All rights reserved.
//

import UIKit
var connectedUsers = ["Ronin","Ruchit"]
var userDesc = ["Canadian", "American"]
var userImages: [UIImage] = [UIImage(imageLiteralResourceName: "icons8-name-90"), UIImage(imageLiteralResourceName: "icons8-name-90")] //image literal
var myIndex = 0

class InboxTableViewController: UITableViewController {



    // MARK: - Table view data source



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
