//
//  InboxTableViewController.swift
//  Inbox-TechJobs
//
//  Created by Ronin Cunningham on 2019-01-26.
//  Copyright © 2019 Ronin Cunningham. All rights reserved.
//

import UIKit
import Firebase

let ref = Database.database().reference()
let employeeRef = ref.child("Employees")





class InboxTableViewController: UITableViewController {



    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cardImageArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.detailTextLabel?.text = ""//MADE SUBTITLES TEMPORARILY BLANK
        cell.textLabel?.text = cardImageArray[indexPath.row]
        cell.imageView?.image = userImages[indexPath.row]
//        cell.imageView
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }

   

}
