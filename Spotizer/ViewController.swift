//
//  ViewController.swift
//  Spotizer
//
//  Created by Pierre Decrock on 16/03/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var rdmSong:Song = Song(title: "test", url: "test")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        artworkImageView.isUserInteractionEnabled = true
        artworkImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))
        //var apiManager = ApiManager()
        
        ApiManager().fetchRandomSong { (data, error) in
            print(data)
            self.rdmSong = data[0]
            DispatchQueue.main.async {
                self.titleLabel.text = data[0].title
            }
            
        }
        
        
        //titleLabel.text = song.title
//        let url = URL(string: song.url)
//        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
//        artworkImageView.image = UIImage(data: data!)
        // Do any additional setup after loading the view.
    }
//    @IBAction func playButton(_ sender: Any) {
//        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "player") as? PlayerViewController {
//            
//            let songsArray = [self.rdmSong]
//            
//            vc.songs = songsArray
//            vc.position = 0
//            self.present(vc, animated: true, completion: nil)
//            
//        }
//    }
    @objc func imageTapped(_ recognizer: UITapGestureRecognizer) {
        print("image tapped")
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "player") as? PlayerViewController {
                
                let songsArray = [self.rdmSong]
                vc.songs = songsArray
                vc.position = 0
                self.present(vc, animated: true, completion: nil)
    
            }
    }


}

