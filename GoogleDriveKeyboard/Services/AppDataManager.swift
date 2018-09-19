//
//  AppDataManager.swift
//  GoogleDriveKeyboard
//
//  Created by Alexander Kravchenko on 19.09.2018.
//  Copyright © 2018 ANODA. All rights reserved.
//

import Foundation

class AppDataManager {
    
    private static let imagesKey = "image-keyboard-saved-images"
    private static let defaults = UserDefaults.standard
    
    static func saveImages(urls: [String]) {
        if var imagesSet = getImages() {
            urls.forEach { imagesSet.insert($0) }
            let data = NSKeyedArchiver.archivedData(withRootObject: imagesSet)
            defaults.set(data, forKey: imagesKey)
        } else {
            let imagesSet = Set<String>(urls)
            let data = NSKeyedArchiver.archivedData(withRootObject: imagesSet)
            defaults.set(data, forKey: imagesKey)
        }
    }
    
    static func fetchImages() -> [String] {
          if let imagesSet = getImages() {
            return Array(imagesSet)
        }
        return []
    }
    
    private static func getImages() -> Set<String>? {
        if let data = defaults.object(forKey: imagesKey) as? Data {
            return NSKeyedUnarchiver.unarchiveObject(with: data) as? Set<String>
        }
        return nil
    }
}
