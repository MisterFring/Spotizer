//
//  Utils.swift
//  Spotizer
//
//  Created by Pierre Decrock on 18/03/2021.
//

import Foundation
import UIKit

class Utils {
    func getImageFromUrl(urlStr:String) -> UIImage {
        let url = URL(string: urlStr)
        var image = UIImage(named: "da")
        if let data = try? Data(contentsOf: url!) {
            image = UIImage(data: data)
        }
        return image!
    }
}
