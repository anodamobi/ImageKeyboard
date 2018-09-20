//
//  KeyboardPractiveVC.swift
//  GoogleDriveKeyboard
//
//  Created by Alexander Kravchenko on 9/12/18.
//  Copyright © 2018 ANODA. All rights reserved.
//

import UIKit
import GoogleSignIn

class KeyboardPracticeVC: UIViewController {
    
    private let textField = UITextField()
    private let titleLabel = UILabel()
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
        
        view.addSubview(titleLabel)
        titleLabel.text = "Now try your new keyboard:"
        titleLabel.numberOfLines = 2
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(textField.snp.top).offset(-20)
        }
        
        gdkView.updateColorScheme(scheme: .light)
        let container = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 290))
        container.addSubview(gdkView)
        gdkView.snp.makeConstraints { $0.edges.equalToSuperview() }
        gdkView.delegate = self
        textField.inputView = container
    }
}

extension KeyboardPracticeVC: GDKeyboardViewDelegate {
    func didSelectItem(image: UIImage) {
        // TODO: (alex) call delegate method
    }
}
