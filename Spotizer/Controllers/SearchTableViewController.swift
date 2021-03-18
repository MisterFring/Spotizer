//
//  SearchTableViewController.swift
//  Spotizer
//
//  Created by Pierre Decrock on 16/03/2021.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate {
    var artistsArray:[Artist] = [Artist(id: 1234, name: "TESTSTSTSTST", pictureUrl: "String")]
    @IBOutlet weak var searchBar: UISearchBar!
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
        searchBar.delegate = self
        
        
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
        return self.artistsArray.count
    }

    // When you clic on an artist
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        print("User cell :  \(cell)")
        print("User touched on \(indexPath) row")
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "album") as? AlbumTableViewController{
            
                // send artist id for deezer request to the album TVC
                vc.artistId = artistsArray[indexPath.row].id
                print(vc.artistId)
                self.navigationController?.pushViewController(vc, animated: true)
            }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
//        let title = self.sounds[indexPath.row]["title"]
//        let artist = self.sounds[indexPath.row]["artist"]
//        let artworkName = self.sounds[indexPath.row]["artworkName"]
//        let image = UIImage(named: artworkName!)
        let artist = self.artistsArray[indexPath.row].name
        //let id = self.artistsArray[indexPath.row].id
        let pictureUrl = self.artistsArray[indexPath.row].pictureUrl
        
        

        print(artistsArray)
        // set the data in the cell
        //cell.textLabel?.text = title! + " - " + artist!
        cell.textLabel?.text = artist
        //cell.detailTextLabel?.text = artist
        cell.imageView!.image = Utils().getImageFromUrl(urlStr: pictureUrl)
        
        // set style of the cell
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)
        
        print(cell)
        return cell
    }
    
    // Set the height of each row
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchText \(searchText)")
        
        if searchText.count > 1 {
            ApiManager().fetchArtists(searchText:searchText) { (data, error) in
                //print(data)
                self.artistsArray = data
                //print(self.artistsArray)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        print("searchText \(searchBar.text)")
//    }

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
