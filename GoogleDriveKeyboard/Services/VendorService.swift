//
//  VendorService.swift
//  GoogleDriveKeyboard
//
//  Created by Inquisitor on 20.09.2018.
//  Copyright © 2018 ANODA. All rights reserved.
//

import Foundation
import GoogleSignIn
import Kingfisher

class VendorService {
    
    static func start() {
        GIDSignIn.sharedInstance().clientID = "319311923623-nu3548j4u25os18mo9gijdfhj78ts2gb.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().scopes = ["https://www.googleapis.com/auth/drive"]
    }
}
