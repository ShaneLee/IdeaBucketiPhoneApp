//
//  IdeaTableViewController.swift
//  IdeaBucketTests
//
//  Created by Shane Lee on 02/11/2019.
//  Copyright © 2019 Shane Lee. All rights reserved.
//

import UIKit

class IdeaTableViewController: UITableViewController {
    
    var ideas = [Idea]()
    
    private func loadIdeas() {
        guard let idea1 = Idea(idea: "This is a test", category: "Test") else {
            fatalError("Unable to instantiate idea")
        }
        guard let idea2 = Idea(idea: "This is a second test", category: "Test") else {
            fatalError("Unable to instantiate idea")
        }
        
        ideas += [idea1, idea2]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadIdeas()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ideas.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "IdeaTableViewCell", for: indexPath) as? IdeaTableViewCell
            else {
                fatalError("The dequeued cell is not an instance of IdeaTableViewCell.")
        }
        
        let idea = ideas[indexPath.row]
        
        cell.ideaLabel.text = idea.idea
        cell.categoryLabel.text = idea.category

        return cell
    }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}