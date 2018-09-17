//
//  KeyboardPractiveVC.swift
//  GoogleDriveKeyboard
//
//  Created by Alexander Kravchenko on 9/12/18.
//  Copyright © 2018 ANODA. All rights reserved.
//

import UIKit
import GoogleSignIn

class KeyboardPracticeVC: UIViewController, GIDSignInUIDelegate {
    
    private let textField = UITextField()
    private let gdkView = GDKeyboardView()
    private let keyboardView = SearchFieldKeyboard()
    
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
        
        gdkView.updateColorScheme(scheme: .light)
        let container = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 290))
        container.addSubview(gdkView)
        gdkView.snp.makeConstraints { $0.edges.equalToSuperview() }
        gdkView.delegate = self
        textField.inputView = container
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().signIn()
    }
}

extension KeyboardPracticeVC: GDKeyboardViewDelegate {
    func didSelectItem(image: UIImage) {
        
    }
}

extension KeyboardPracticeVC: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            GoogleDriveService.shared.getFilesList()
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        debugPrint("Disconnected")
    }
}
