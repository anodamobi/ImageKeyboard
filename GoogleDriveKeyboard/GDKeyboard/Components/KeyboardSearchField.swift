//
//  KeyboardSearchField.swift
//  GoogleDriveKeyboard
//
//  Created by Alexander Kravchenko on 9/12/18.
//  Copyright © 2018 ANODA. All rights reserved.
//

import UIKit

class KeyboardSearchField: UIView {
    
    private let textField = UITextField()
    
    var inputField: UITextField {
        return textField
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
        
        addSubview(textField)
        textField.backgroundColor = UIColor.gdkLightBlue
        textField.font = UIFont.boldSystemFont(ofSize: 18)
        textField.textColor = .white
        textField.attributedPlaceholder = NSAttributedString(string:"Search Item",
                                                            attributes: [.foregroundColor: UIColor.white])
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: 0))
        textField.leftViewMode = .always
        textField.snp.makeConstraints {
            $0.left.equalToSuperview().offset(8)
            $0.top.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().offset(-8)
            $0.right.equalToSuperview().offset(-8)
        }
    }
}
