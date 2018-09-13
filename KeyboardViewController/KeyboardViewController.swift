//
//  KeyboardViewController.swift
//  KeyboardViewController
//
//  Created by Alexander Kravchenko on 9/13/18.
//  Copyright © 2018 ANODA. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    private let keyboardView = GDKeyboardView()
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputView?.addSubview(keyboardView)
        keyboardView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        keyboardView.delegate = self
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        let colorScheme: KeyboardColorScheme
        
        if textDocumentProxy.keyboardAppearance == .dark {
            colorScheme = .dark
        } else {
            colorScheme = .light
        }
        
        keyboardView.updateColorScheme(scheme: colorScheme)
    }
}

extension KeyboardViewController: GDKeyboardViewDelegate {
    func didSelectItem(image: UIImage) {
        
    }
}
