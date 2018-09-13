//
//  KeyboardSearchField.swift
//  GoogleDriveKeyboard
//
//  Created by Alexander Kravchenko on 9/12/18.
//  Copyright © 2018 ANODA. All rights reserved.
//

import UIKit

protocol SearchFieldViewDelegate: class {
    func didBeginEditing()
}

class CancelButtonFreeSearchBar: UISearchBar {
    override func layoutSubviews() {
        super.layoutSubviews()
        setShowsCancelButton(false, animated: false)
    }
}

class SearchFieldView: UIView {
    
    private let searchBar = CancelButtonFreeSearchBar()
    weak var delegate: SearchFieldViewDelegate?
    
    var searchField: UISearchBar {
        return searchBar
    }
    
    var textField: UITextField? {
        return searchBar.value(forKey: "searchField") as? UITextField
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
        
        textField?.addTarget(self, action: #selector(editingBegin), for: .editingDidBegin)
        textField?.clearButtonMode = .never
        
        addSubview(searchBar)
        searchBar.barTintColor = .white
        searchBar.showsCancelButton = true
        searchBar.backgroundColor = .white
        searchField.placeholder = "Search Item"
        searchBar.snp.makeConstraints {
            $0.left.equalToSuperview().offset(8)
            $0.top.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().offset(-8)
            $0.right.equalToSuperview().offset(-8)
        }
    }
    
    @objc
    private func editingBegin() {
        delegate?.didBeginEditing()
    }
}
