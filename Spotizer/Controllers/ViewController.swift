//
//  ViewController.swift
//  Spotizer
//
//  Created by Pierre Decrock on 16/03/2021.
//

import UIKit

class ViewController: UIViewController {
    public var songs:[Song]!
    public var positon:Int!

    @IBOutlet weak var otherButton: UIButton!
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var rdmSong:Song = Song(title: "test", url: "test", urlImage: "test")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set radius on artworkImageView's corners 
        self.artworkImageView.layer.masksToBounds = true
        self.artworkImageView.layer.cornerRadius = 20

        artworkImageView.isUserInteractionEnabled = true
        artworkImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))
        //var apiManager = ApiManager()
        
        ApiManager().fetchRandomSong { (data, error) in
            //print(data)
            self.rdmSong = data[0]
            let url = URL(string: self.rdmSong.urlImage)
            if let data = try? Data(contentsOf: url!) {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.titleLabel.text = self.rdmSong.title;                    self.artworkImageView.image = image
                }
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
    @IBAction func otherTapped(_ sender: Any) {
        ApiManager().fetchRandomSong { (data, error) in
            //print(data)
            self.rdmSong = data[0]
            let url = URL(string: self.rdmSong.urlImage)
            if let data = try? Data(contentsOf: url!) {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.titleLabel.text = self.rdmSong.title;                    self.artworkImageView.image = image
                }
            }
            
            
        }
    }
    
    @objc func imageTapped(_ recognizer: UITapGestureRecognizer) {
        print("image tapped")
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "player") as? PlayerViewController {
                
                let imageTest = Utils().getImageFromUrl(urlStr: rdmSong.urlImage)
                let songsArray = [self.rdmSong]
                vc.songs = songsArray
                vc.position = 0
                vc.artworkImage = imageTest
                self.present(vc, animated: true, completion: nil)
    
            }
    }

}

