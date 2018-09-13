//
//  KeyboardPractiveVC.swift
//  GoogleDriveKeyboard
//
//  Created by Alexander Kravchenko on 9/12/18.
//  Copyright © 2018 ANODA. All rights reserved.
//

import UIKit

class KeyboardPracticeVC: UIViewController {
    
    private let textField = UITextField()
    private let gdkView = GDKeyboardView()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        view.addSubview(textField)
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(44)
            $0.width.equalTo(200)
        }
        
        let container = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 290))
        container.addSubview(gdkView)
        gdkView.snp.makeConstraints { $0.edges.equalToSuperview() }
        textField.inputView = container
    }
}
