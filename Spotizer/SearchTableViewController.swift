//
//  SearchTableViewController.swift
//  Spotizer
//
//  Created by Pierre Decrock on 16/03/2021.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    let sounds = [
        [
            "title":"Dakiti",
            "artist":"Bad Bunny",
            "artworkName":"dakiti",
            "audioFileName":"dakiti"
        ],
        [
            "title":"Lose yourself",
            "artist":"Eminem",
            "artworkName":"loseYourself",
            "audioFileName":"loseYourself"
        ],
        [
            "title":"Something about us",
            "artist":"Daft Punk",
            "artworkName":"somethingAboutUs",
            "audioFileName":"somethingAboutUs"
        ],
        [
            "title":"Da",
            "artist":"PNL",
            "artworkName":"da",
            "audioFileName":"da"
        ]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.sounds.count
    }

    // When you clic on a song
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "player") as? PlayerViewController {
//                
//                vc.songs = sounds
//                vc.position = indexPath.row
//            
//                self.present(vc, animated: true, completion: nil)
//            }
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let title = self.sounds[indexPath.row]["title"]
        let artist = self.sounds[indexPath.row]["artist"]
        let artworkName = self.sounds[indexPath.row]["artworkName"]
        let image = UIImage(named: artworkName!)
        
        // set the data in the cell
        //cell.textLabel?.text = title! + " - " + artist!
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = artist
        cell.imageView!.image = image
        
        // set style of the cell
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)

        return cell
    }
    
    // Set the height of each row
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
