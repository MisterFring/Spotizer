//
//  PlayerController.swift
//  Spotizer
//
//  Created by Pierre Decrock on 17/03/2021.
//

import Foundation
import AVFoundation
import UIKit


final class PlayerManager {
    static let shared = PlayerManager()
    //var url: String?

    private init() { }
    
    public var player:AVAudioPlayer?
    
    func playMusic(url:String){
        let url = Bundle.main.path(forResource: url, ofType: "mp3")
        do {
            // pas cherché à comprendre
            try AVAudioSession.sharedInstance().setMode(.default)
//            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            // unwrap (!), vérifie si c'est pas nil ?
            player = try AVAudioPlayer(contentsOf: URL(string: url!)!)
            player?.play()
            //playButton.setBackgroundImage(pauseIcon, for: UIControl.State.normal)
            //playButton.setBackgroundImage(pauseIcon, for: UIControl.State.normal)
            
        }
        catch {
            print("error")
        }
    }
    
    func playStop(button:UIButton){
        let isPlay = player?.isPlaying
        if isPlay! {
            player?.stop()
            button.setBackgroundImage(UIImage(systemName: "play"), for: UIControl.State.normal)
            
        } else {
            player?.play()
            button.setBackgroundImage(UIImage(systemName: "pause"), for: UIControl.State.normal)
        }
    }
}

