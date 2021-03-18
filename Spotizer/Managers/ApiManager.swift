//
//  ApiManager.swift
//  Spotizer
//
//  Created by Pierre Decrock on 17/03/2021.
//

import Foundation

class ApiManager {
    
    func fetchSongs() {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let url = URL(string: "https://api.deezer.com/album/302127")!
        
        let task = session.dataTask(with: url) {
            (data, response, error) in
            if error != nil {
                print(error?.localizedDescription ?? "error")
            } else {
                if let json = try? JSONSerialization.jsonObject(with: data!, options: []){
                   // print("\(json)")
                    if let data = json as? [String:AnyObject] {
                        if let dataArtist = data["artist"] as? [String:AnyObject]{
                            print(dataArtist)
                        }
                    }
                }
            }
        }
        task.resume()
    }
    
    func fetchRandomSong(completion: @escaping (_ data : Array<Song>, _ error: Error?) -> Void) -> Void {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        var randomSong = Song(title: "test", url: "test")
        
        let url = URL(string: "https://api.deezer.com/track/3135556")!
        
        let task = session.dataTask(with: url) {
            (data, response, error) in
            if error != nil {
                print(error?.localizedDescription ?? "error")
            } else {
                if let json = try? JSONSerialization.jsonObject(with: data!, options: []){
                    if let data = json as? [String:AnyObject] {
                        let title = data["title"] as? String
                        let url = data["preview"] as? String
                        
                        print(data)
                        
                        randomSong = Song(title: title!, url: url!)
                        print(randomSong)
                        
                        completion([randomSong], error)
                        
                    }
                }
            }
        }
        task.resume()
        //print(randomSong)
    }
}
struct Song {
    var title:String
    var url:String
}
