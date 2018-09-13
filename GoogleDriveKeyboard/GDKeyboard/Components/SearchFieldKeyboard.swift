//
//  SearchFieldKeyboard.swift
//  GoogleDriveKeyboard
//
//  Created by Alexander Kravchenko on 9/13/18.
//  Copyright © 2018 ANODA. All rights reserved.
//

import UIKit

protocol SearchFieldKeyboardDelegate: class {
    func didSelectCharacter(character: String)
    func didSelectClose()
    func didSelectSpace()
    func didSelectDelete()
}

// This keyboard is being used to input text into GDKeyboard's search field
class SearchFieldKeyboard: UIView {
    
    private let firstRowButtonTitles = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"]
    private let secondRowButtonTitles = ["A", "S", "D", "F", "G", "H", "J", "K", "L"]
    private let thirdRowButtonTitles = ["Z", "X", "C", "V", "B", "N", "M"]
    private let forthRowButtonTitles = ["Close", "Space", "Delete"]

    private let firstRowStack = UIStackView()
    private let secondRowStack = UIStackView()
    private let thirdRowStack = UIStackView()
    private let forthRowStack = UIStackView()
    
    private let mainStackView = UIStackView()
    
    weak var delegate: SearchFieldKeyboardDelegate?
    
    init() {
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(mainStackView)
        mainStackView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillEqually
        
        firstRowStack.axis = .horizontal
        firstRowStack.distribution = .fillEqually
        
        secondRowStack.axis = .horizontal
        secondRowStack.distribution = .fillEqually
        
        thirdRowStack.axis = .horizontal
        thirdRowStack.distribution = .fillEqually
        
        forthRowStack.axis = .horizontal
        forthRowStack.distribution = .fillEqually
        
        mainStackView.addArrangedSubview(firstRowStack)
        mainStackView.addArrangedSubview(secondRowStack)
        mainStackView.addArrangedSubview(thirdRowStack)
        mainStackView.addArrangedSubview(forthRowStack)
        
        buttons(row: 0).forEach { firstRowStack.addArrangedSubview($0) }
        buttons(row: 1).forEach { secondRowStack.addArrangedSubview($0) }
        buttons(row: 2).forEach { thirdRowStack.addArrangedSubview($0) }
        buttons(row: 3).forEach { forthRowStack.addArrangedSubview($0) }
    }
    
    private func buttons(row: Int) -> [UIButton] {
        let titles: [String]
        
        switch row {
        case 0:
            titles = firstRowButtonTitles
        case 1:
            titles = secondRowButtonTitles
        case 2:
            titles = thirdRowButtonTitles
        case 3:
            titles = forthRowButtonTitles
        default:
            fatalError()
        }
        
        var result: [UIButton] = []
        titles.forEach { result.append(keyboardButton(title: $0)) }
        return result
    }
    
    private func keyboardButton(title: String) -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.setBackgroundColor(color: .white, forState: .normal)
        button.setBackgroundColor(color: .lightGray, forState: .selected)
        button.setTitleColor(.darkGray, for: .normal)
        button.addTarget(self, action: #selector(handleButtonPress(button:)), for: .touchUpInside)
        return button
    }
    
    @objc
    private func handleButtonPress(button: UIButton) {
        guard let title = button.titleLabel?.text else { return }
        switch title {
        case "Close":
            delegate?.didSelectClose()
        case "Space":
            delegate?.didSelectSpace()
        case "Delete":
            delegate?.didSelectDelete()
        default:
            delegate?.didSelectCharacter(character: title)
        }
    }
}
