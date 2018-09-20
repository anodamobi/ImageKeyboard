//
//  GoogleDriveAccessVC.swift
//  GoogleDriveKeyboard
//
//  Created by Inquisitor on 20.09.2018.
//  Copyright © 2018 ANODA. All rights reserved.
//

import UIKit
import GoogleSignIn
import MBProgressHUD

class GoogleDriveAccessVC: UIViewController, GIDSignInUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
    }
    
    
    @IBAction func connectGoogleDrive(_ sender: Any) {
        MBProgressHUD.showAdded(to: view, animated: true)
        GIDSignIn.sharedInstance().signIn()
    }
}

extension GoogleDriveAccessVC: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            MBProgressHUD.hide(for: view, animated: true)
            print("\(error.localizedDescription)")
        } else {
            GoogleDriveService.shared.getFilesList({ [unowned self] (error) in
                MBProgressHUD.hide(for: self.view, animated: true)
                if let error = error {
                    debugPrint(error.localizedDescription)
                    return
                }
                self.navigationController?.pushViewController(KeyboardPracticeVC(), animated: true)
            })
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        debugPrint("Disconnected")
    }
}

