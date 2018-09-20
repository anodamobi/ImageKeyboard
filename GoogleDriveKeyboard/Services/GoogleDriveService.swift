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
    
    func getFilesList(folderId: String = "", _ completion: @escaping ((Error?) -> Void)) {
        
        let query = GTLRDriveQuery_FilesList.query()
        query.q = folderId.isEmpty ? "" : "'\(folderId)' IN parents and mimeType = 'image/gif'"
        query.fields = folderId.isEmpty ? nil : "files(id, name, webContentLink, mimeType)"

        query.pageSize = 100
        
        _ = service.executeQuery(query) { [unowned self] (tk, data, error) in
            guard let filesList : GTLRDrive_FileList = data as? GTLRDrive_FileList,
                let filesShow : [GTLRDrive_File] = filesList.files else { completion(error); return }

            if folderId.isEmpty {
                guard let imageKeyboardFolder = filesShow.filter({ file -> Bool in return file.name == "ImageKeyboard" }).first,
                    let folderId = imageKeyboardFolder.identifier
                else { completion(error); return }
                
                self.getFilesList(folderId: folderId, completion)
            } else {
                debugPrint("GIFs found: \(filesShow)")
                let urls = filesShow.compactMap { return $0.webContentLink }
                AppDataManager.saveImages(urls: urls)
                completion(nil)
            }
        }
    }
}
