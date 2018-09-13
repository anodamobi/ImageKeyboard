//
//  KeyboardColors.swift
//  GoogleDriveKeyboard
//
//  Created by Alexander Kravchenko on 9/13/18.
//  Copyright © 2018 ANODA. All rights reserved.
//

import UIKit

enum KeyboardColorScheme {
    case dark
    case light
}

struct KeyboardColors {
    let buttonTextColor: UIColor
    let buttonBackgroundColor: UIColor
    let buttonHighlightColor: UIColor
    
    init(colorScheme: KeyboardColorScheme) {
        switch colorScheme {
        case .light:
            buttonTextColor = .lightGray
            buttonBackgroundColor = .white
            buttonHighlightColor = .darkGray
        case .dark:
            buttonTextColor = .white
            buttonBackgroundColor = .darkGray
            buttonHighlightColor = .lightGray
        }
    }
}
