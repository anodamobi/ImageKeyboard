//
//  UIButton+Ext.swift
//  GoogleDriveKeyboard
//
//  Created by Alexander Kravchenko on 9/13/18.
//  Copyright © 2018 ANODA. All rights reserved.
//

import UIKit

extension UIButton {
    func setBackgroundColor(color: UIColor, forState: UIControlState) {
        let colorImage = UIImage.image(from: color, size: CGSize(width: 1, height: 1))
        self.setBackgroundImage(colorImage, for: forState)
    }
}

extension UIImage {
    
    static func image(from color: UIColor, size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContext(CGSize(width: size.width, height: size.height))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0,
                                                   width: size.width,
                                                   height: size.height))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return colorImage
    }
}
