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
    
    //public var player:AVAudioPlayer?
    public var player:AVPlayer?
    
    //    func playMusic(url:String){
    //        let url = Bundle.main.path(forResource: url, ofType: "mp3")
    //        do {
    //            // pas cherché à comprendre
    //            try AVAudioSession.sharedInstance().setMode(.default)
    ////            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
    //
    //            // unwrap (!), vérifie si c'est pas nil ?
    //            player = try AVAudioPlayer(contentsOf: URL(string: url!)!)
    //            player?.play()
    //            let apiManager = ApiManager()
    //            //apiManager.fetchSongs()
    //            apiManager.fetchRandomSong()
    //
    //
    //
    //            //playButton.setBackgroundImage(pauseIcon, for: UIControl.State.normal)
    //            //playButton.setBackgroundImage(pauseIcon, for: UIControl.State.normal)
    //
    //        }
    //        catch {
    //            print("error")
    //        }
    //    }
    
    func playStop(button:UIButton){
        let isPlay = player?.isPlaying
        
        if isPlay! {
            player?.pause()
            button.setBackgroundImage(UIImage(systemName: "play"), for: UIControl.State.normal)
            
        } else {
            player?.play()
            button.setBackgroundImage(UIImage(systemName: "pause"), for: UIControl.State.normal)
        }
    }
    
    func playAudioFromURL(urlDeezer:String) {
        guard let url = URL(string:urlDeezer) else {
            print("error to get the mp3 file")
            return
        }
        do {
            //player = try AVPlayer(url: url as URL)
            player = AVPlayer(url: url)
            player?.play()
        } catch {
            print("audio file error")
        }
        //audioPlayer?.play()
    }
}
