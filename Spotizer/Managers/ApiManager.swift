//
//  ApiManager.swift
//  Spotizer
//
//  Created by Pierre Decrock on 17/03/2021.
//

import Foundation

class ApiManager {
    
    var tracksIdArray = ["3135562","3135563","3135564", "3135565", "3135566", "440035032", "465176382", "466723862", "466804802", "444261522", "125699152", "419133822", "142986200", "139786807"]
    
//    func fetchSongs() {
//        let config = URLSessionConfiguration.default
//        let session = URLSession(configuration: config)
//
//        let url = URL(string: "https://api.deezer.com/album/302127")!
//
//        let task = session.dataTask(with: url) {
//            (data, response, error) in
//            if error != nil {
//                print(error?.localizedDescription ?? "error")
//            } else {
//                if let json = try? JSONSerialization.jsonObject(with: data!, options: []){
//                   // print("\(json)")
//                    if let data = json as? [String:AnyObject] {
//                        if let dataArtist = data["artist"] as? [String:AnyObject]{
//                            print(dataArtist)
//                        }
//                    }
//                }
//            }
//        }
//        task.resume()
//    }
    func fetchArtists(searchText:String ,completion: @escaping (_ data : [Artist], _ error: Error?) -> Void){
        var artistsArray = [Artist]()
        let strUrl = "https://api.deezer.com/search/artist?q=" + searchText.slugify()
        print(searchText.slugify())
        let url = URL(string: strUrl)!
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url) {
            (data, response, error) in
            if error != nil {
                print(error?.localizedDescription ?? "error")
            } else {
                if let json = try? JSONSerialization.jsonObject(with: data!, options: []){
                    if let data = json as? [String:AnyObject] {
                        let trueData = data["data"] as? [[String:AnyObject]]
                        //print(trueData)
                        for item in trueData! {
                            let name = item["name"] as? String
                            let id = item["id"] as? Int
                            let pictureUrl = item["picture"] as? String
                            
                            let artist = Artist(id: id!, name: name!, pictureUrl: pictureUrl!)
                            //print(artist)
                            artistsArray.append(artist)
                        }
                        //print(artistsArray)
                        completion(artistsArray, error)
                        
                    }
                }
            }
        }
        task.resume()
    }
    
    func fetchRandomSong(completion: @escaping (_ data : Array<Song>, _ error: Error?) -> Void) -> Void {
        // take a random track id
        let randomId = self.tracksIdArray[Int.random(in: 0..<self.tracksIdArray.count)]
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        var randomSong = Song(title: "test", url: "test", urlImage: "test")
        
        let strUrl = "https://api.deezer.com/track/" + randomId
        let url = URL(string: strUrl)!
        
        let task = session.dataTask(with: url) {
            (data, response, error) in
            if error != nil {
                print(error?.localizedDescription ?? "error")
            } else {
                if let json = try? JSONSerialization.jsonObject(with: data!, options: []){
                    if let data = json as? [String:AnyObject] {
                        
                        let title = data["title"] as? String
                        let url = data["preview"] as? String
                        let albumInfo = data["album"] as? NSDictionary
                        let urlImage = albumInfo!["cover_medium"] as? String

                        randomSong = Song(title: title!, url: url!, urlImage: urlImage!)
                        print(randomSong)
                        
                        completion([randomSong], error)
                        
                    }
                }
            }
        }
        task.resume()
        //print(randomSong)
    }
    
    func fetchAlbumsFromArtistId(id: Int,completion: @escaping (_ data : [Album], _ error: Error?) -> Void) -> Void {
        
        var albumsArray = [Album]()
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let strUrl = "https://api.deezer.com/artist/\(id)/albums"
        let url = URL(string: strUrl)!
        
        let task = session.dataTask(with: url) {
            (data, response, error) in
            if error != nil {
                print(error?.localizedDescription ?? "error")
            } else {
                if let json = try? JSONSerialization.jsonObject(with: data!, options: []){
                    if let data = json as? [String:AnyObject] {
                        let trueData = data["data"] as? [[String:AnyObject]]
                        //print(trueData)
                        for item in trueData! {
                            let id = item["id"] as? Int
                            let title = item["title"] as? String
                            let pictutreUrl = item["cover_medium"] as? String
                            
                            let myAlbum = Album(id: id!, title: title!, pictureUrl: pictutreUrl!)
                            albumsArray.append(myAlbum)
                        }
                        completion(albumsArray, error)
                        
                    }
                }
            }
        }
        task.resume()
    }
    
    func fetchTracksFromAlbumId(id:Int, completion: @escaping (_ data : [Song], _ error: Error?) -> Void) -> Void {
        var tracksArray = [Song]()
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let strUrl = "https://api.deezer.com/album/\(id)"
        let url = URL(string: strUrl)!
        
        let task = session.dataTask(with: url) {
            (data, response, error) in
            if error != nil {
                print(error?.localizedDescription ?? "error")
            } else {
                if let json = try? JSONSerialization.jsonObject(with: data!, options: []){
                    if let data = json as? [String:AnyObject] {
                        let pictutreUrl = data["cover_medium"] as? String
                        let trueData = data["tracks"]!["data"] as? [[String:AnyObject]]
                        //print(trueData)
                        for item in trueData! {
                            let url = item["preview"] as? String
                            let title = item["title"] as? String
                            
                            let song = Song(title: title!, url: url!, urlImage: pictutreUrl!)
                            tracksArray.append(song)
                        }
                        completion(tracksArray, error)
                        
                    }
                }
            }
        }
        task.resume()
    }
}


struct Song {
    var title:String
    var url:String
    var urlImage:String
}

struct Artist {
    var id:Int
    var name:String
    var pictureUrl:String
}

struct Album {
    var id:Int
    var title:String
    var pictureUrl : String
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
