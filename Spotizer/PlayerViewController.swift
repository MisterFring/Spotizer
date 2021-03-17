//
//  PlayerViewController.swift
//  Spotizer
//
//  Created by Pierre Decrock on 16/03/2021.
//

import AVFoundation
import UIKit

class PlayerViewController: UIViewController {
    
    public var songs:[[String : String]] = []
    public var position:Int = 0
    //var player:AVAudioPlayer?
   
    
    @IBOutlet weak var holder: UIView!
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePlayer()
        PlayerManager.shared.playMusic(url:songs[position]["audioFileName"]!)
        

        // Do any additional setup after loading the view.
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
        let artworkImage = UIImage(named: song["artworkName"]!)
        let title = song["title"]

        artworkImageView.image = artworkImage
        titleLabel.text = title
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
