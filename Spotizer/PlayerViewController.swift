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
    var player:AVAudioPlayer?
    let playIcon = UIImage(systemName: "play")
    let pauseIcon = UIImage(systemName: "pause")
    
    @IBOutlet weak var holder: UIView!
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePlayer()

        // Do any additional setup after loading the view.
    }
    @IBAction func playAndStopButton(_ sender: UIButton) {
        let isPlay = player?.isPlaying
        
        //isPlay! ? player?.stop():player?.play()
        if isPlay! {
            player?.stop()
            playButton.setBackgroundImage(playIcon, for: UIControl.State.normal)
        } else {
            player?.play()
            playButton.setBackgroundImage(pauseIcon, for: UIControl.State.normal)
        }
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
        
        let url = Bundle.main.path(forResource: song["audioFileName"], ofType: "mp3")
        
        do {
            // pas cherché à comprendre
            try AVAudioSession.sharedInstance().setMode(.default)
//            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            // unwrap (!), vérifie si c'est pas nil ?
            player = try AVAudioPlayer(contentsOf: URL(string: url!)!)
            player?.play()
            playButton.setBackgroundImage(pauseIcon, for: UIControl.State.normal)
            //playButton.setBackgroundImage(pauseIcon, for: UIControl.State.normal)

            
            // DEBILE DE METTRE UN PLAYER DANS UNE MODAL?
            
        }
        catch {
            print("error")
        }
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
