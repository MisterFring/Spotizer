//
//  AlbumTableViewController.swift
//  Spotizer
//
//  Created by Pierre Decrock on 18/03/2021.
//

import UIKit

class AlbumTableViewController: UITableViewController {
    public var artistId:Int = 0
    public var artistName:String = "test nom artist"
    
    var albums:[Album] = [Album(id: 12, title: "I'm a title", pictureUrl: "test")]
    
    @IBOutlet weak var artistLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        artistLabel.text = artistName
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Player", style: .plain, target: self, action: #selector(self.displayPlayer))
        
        ApiManager().fetchAlbumsFromArtistId(id:self.artistId) { (data, error) in
            self.albums = data
            print(data)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

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
        return self.albums.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "album", for: indexPath)

        // Configure the cell...
        print(albums[indexPath.row].title)
        cell.textLabel?.text = albums[indexPath.row].title
        cell.imageView?.image = Utils().getImageFromUrl(urlStr: albums[indexPath.row].pictureUrl)

        return cell
    }
    
    // When you clic on an album
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let cell = tableView.cellForRow(at: indexPath)!
        //print("User cell :  \(cell)")
        //print("User touched on \(indexPath) row")
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "tracks") as? TrackTableViewController{
            
                vc.albumId = self.albums[indexPath.row].id
                vc.artistName = self.artistName
                vc.albumName = self.albums[indexPath.row].title
                self.navigationController?.pushViewController(vc, animated: true)
            }
    }
    
    
    @objc func displayPlayer(sender:AnyObject){
        print("button player tapped")
    }
    
    

 

}
