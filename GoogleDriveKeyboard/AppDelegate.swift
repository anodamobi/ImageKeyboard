//
//  AppDelegate.swift
//  GoogleDriveKeyboard
//
//  Created by Alexander Kravchenko on 9/12/18.
//  Copyright © 2018 ANODA. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        return true
    }

    private func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = KeyboardPracticeVC()
        window?.makeKeyAndVisible()
    }

}

