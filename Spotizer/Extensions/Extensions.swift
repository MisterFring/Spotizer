//
//  Extensions.swift
//  Spotizer
//
//  Created by Pierre Decrock on 19/03/2021.
//

import Foundation
import UIKit
import AVKit

extension UIViewController {
    func callPlayerModal(song:Song){
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "player") as? PlayerViewController {
                let imageTest = Utils().getImageFromUrl(urlStr: song.urlImage)
                vc.songs = [song]
                vc.position = 0
                vc.artworkImage = imageTest
                self.present(vc, animated: true, completion: nil)

        }
    }
}

extension String {
  private static let allowedCharacters = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-")
  
  public func slugify() -> String {
    let cocoaString = NSMutableString(string: self) as CFMutableString
    CFStringTransform(cocoaString, nil, kCFStringTransformToLatin, false)
    CFStringTransform(cocoaString, nil, kCFStringTransformStripCombiningMarks, false)
    CFStringLowercase(cocoaString, .none)

    return String(cocoaString)
      .components(separatedBy: String.allowedCharacters.inverted)
      .filter { $0 != "" }
      .joined(separator: "-")
  }
}

extension AVPlayer {
    var isPlaying: Bool {
        return rate != 0 && error == nil
    }
}


