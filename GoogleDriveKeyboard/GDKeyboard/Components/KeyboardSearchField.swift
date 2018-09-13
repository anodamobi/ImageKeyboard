//
//  KeyboardSearchField.swift
//  GoogleDriveKeyboard
//
//  Created by Alexander Kravchenko on 9/12/18.
//  Copyright © 2018 ANODA. All rights reserved.
//

import UIKit

class KeyboardSearchField: UIView {
    
    private let searchBar = UISearchBar()
    
    var searchField: UISearchBar {
        return searchBar
    }
    
    init() {
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = UIColor.gdkBlue
        
        addSubview(searchBar)
        searchBar.barTintColor = .white
        searchBar.backgroundColor = .white
        searchField.placeholder = "Search Item"
        searchBar.snp.makeConstraints {
            $0.left.equalToSuperview().offset(8)
            $0.top.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().offset(-8)
            $0.right.equalToSuperview().offset(-8)
        }
    }
}
