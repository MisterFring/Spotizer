//
//  PlayerViewController.swift
//  Spotizer
//
//  Created by Pierre Decrock on 16/03/2021.
//

import AVFoundation
import UIKit

class PlayerViewController: UIViewController {
    
    public var songs:[Song] = []
    public var position:Int = 0
    public var song:Song?
    public var artworkImage:UIImage?
    //var player:AVAudioPlayer?
   
    
    @IBOutlet weak var holder: UIView!
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePlayer()
        
        // set radius on artworkImageView's corners
        self.artworkImageView.layer.masksToBounds = true
        self.artworkImageView.layer.cornerRadius = 30
        
        //PlayerManager.shared.playMusic(url:songs[position]["audioFileName"]!)

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        // set radius on artworkImageView's corners
        self.artworkImageView.layer.masksToBounds = true
        self.artworkImageView.layer.cornerRadius = 30
    }
    
    @IBAction func playAndStopButton(_ sender: UIButton) {
        PlayerManager.shared.playStop(button:sender)
    }
    
    // configure le player qu'une fois meme si on le rappelle ??
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        //if holder.subviews.count == 0 {
//            configurePlayer()
//        //}
//    }
    
    func configurePlayer() {
        let song = songs[position]
        //let artworkImage = UIImage(named: song.blabablbal!)
        let title = song.title
        

        artworkImageView.image = self.artworkImage
        titleLabel.text = title
        PlayerManager.shared.playAudioFromURL(urlDeezer: song.url)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
