//
//  Highscore.swift
//  Hangman
//
//  Created by marek on 02/06/2017.
//  Copyright © 2017 marek. All rights reserved.
//

import UIKit

class Highscore: UITableViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        //let userDefaults = UserDefaults.standard.array(forKey: "highscore")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var scores:Int
        if(UserDefaults.standard.array(forKey: "highscore")?.count == nil){
            scores = 1
        }else if (UserDefaults.standard.array(forKey: "highscore")!.count < 1){
            scores = 1
        }else{
            scores = UserDefaults.standard.array(forKey: "highscore")!.count
        }
        return scores
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HighscoreCell
        //print(scores)
        // Configure the cell...
        if(UserDefaults.standard.array(forKey: "highscore")?.count == nil){
            cell.cellLabel?.text = "brak rekordow"
        }else{
            let high = UserDefaults.standard.array(forKey: "highscore")![indexPath.row]
            print(high)
            cell.cellLabel?.text = "\(high)"
        }
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
