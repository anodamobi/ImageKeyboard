//
//  GoogleDriveService.swift
//  GoogleDriveKeyboard
//
//  Created by Alexander Kravchenko on 9/13/18.
//  Copyright © 2018 ANODA. All rights reserved.
//

import GoogleAPIClientForREST
import GoogleSignIn
import GTMOAuth2

class GoogleDriveService {
    
    private init() {
        service.authorizer = GIDSignIn.sharedInstance().currentUser.authentication.fetcherAuthorizer()
    }
    static let shared = GoogleDriveService()
    
    private let service = GTLRDriveService()
    
    func getFilesList() {
        
        let query = GTLRDriveQuery_FilesList.query()
        query.q = ""//folderId.isEmpty ? "" : "fileId=\(folderId)"
    
        query.pageSize = 100
        
        let ticket: GTLRServiceTicket = service.executeQuery(query) { [unowned self] (tk, data, error) in
            guard let filesList : GTLRDrive_FileList = data as? GTLRDrive_FileList,
                let filesShow : [GTLRDrive_File] = filesList.files else { return }

            guard let imageKeyboardFolder = filesShow.filter({ file -> Bool in return file.name == "ImageKeyboard" }).first,
                let folderId = imageKeyboardFolder.identifier
            else { return }
            
            self.getFile(id: folderId)
        }
    }
    
    private func getFile(id: String) {
        let query = GTLRDriveQuery_FilesList.query()
        query.q = "'\(id)' IN parents"
        
        let ticket: GTLRServiceTicket = service.executeQuery(query) { [unowned self] (tk, data, error) in
            guard let filesList : GTLRDrive_FileList = data as? GTLRDrive_FileList,
                let filesShow : [GTLRDrive_File] = filesList.files else { return }
            
            let gifs = filesShow.filter({ file -> Bool in file.mimeType == "image/gif" })
            
            debugPrint("GIFs found: \(gifs)")
        }
    }
}
