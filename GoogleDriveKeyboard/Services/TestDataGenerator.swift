//
//  TestDataGenerator.swift
//  GoogleDriveKeyboard
//
//  Created by Alexander Kravchenko on 9/12/18.
//  Copyright © 2018 ANODA. All rights reserved.
//

import Foundation

class TestDataGenerator {
    
    private static var images = ["https://i.imgur.com/ZK5DVuN.gif",
                                  "https://thumbs.gfycat.com/WelllitTerribleCockerspaniel-max-1mb.gif",
                                  "https://9to5animations.com/wp-content/uploads/2017/01/Donald-Trump-funny-gif-image.gif",
                                  "https://media.giphy.com/media/xd0jV4utgDoFa/giphy.gif"]
    
    static func KeyboardItemCellVMs(quantity: Int = 30) -> [KeyboardItemCellViewModel] {
        
        var result: [KeyboardItemCellViewModel] = []
        
        for _ in 0..<quantity {
            
            let imageIndex = Int(arc4random_uniform(4))
            let imageURL = images[imageIndex]
            
            let model = KeyboardItemCellViewModel()
            model.itemURL = imageURL
            
            result.append(model)
        }
        return result
    }
}
