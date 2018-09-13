//
//  GDKeyboardView.swift
//  GoogleDriveKeyboard
//
//  Created by Alexander Kravchenko on 9/12/18.
//  Copyright © 2018 ANODA. All rights reserved.
//

import UIKit
import AlisterSwift

protocol GDKeyboardViewDelegate: class {
    func didSelectItem(image: UIImage)
}

class GDKeyboardView: UIView {
    
    private static var collectionViewLayout: UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }
    
    private let searchFieldView = SearchFieldView()
    private let searchFieldKeyboard = SearchFieldKeyboard()
    private let controller: GDKeyboardCollectionController
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
    
    weak var delegate: GDKeyboardViewDelegate?
    
    var isInternalKeyboardHidded: Bool = false {
        didSet {
            searchFieldKeyboard.isHidden = isInternalKeyboardHidded
            searchFieldKeyboard.isUserInteractionEnabled = !isInternalKeyboardHidded
        }
    }
    
    init() {
        controller = GDKeyboardCollectionController(collectionView: collectionView)
        super.init(frame: .zero)
        configureUI()
        configureAlister()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .clear
        
        addSubview(searchFieldView)
        searchFieldView.snp.makeConstraints {
            $0.left.top.right.equalToSuperview()
            $0.height.equalTo(54)
        }
        
        addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.snp.makeConstraints {
            $0.top.equalTo(searchFieldView.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
            $0.height.equalTo(236)
        }
        
        isInternalKeyboardHidded = true
        addSubview(searchFieldKeyboard)
        searchFieldKeyboard.delegate = self
        searchFieldKeyboard.snp.makeConstraints { $0.edges.equalTo(collectionView) }
    }
    
    private func configureAlister() {
        controller.configureCells {
            $0.register(cell: KeyboardItemCell.self, for: KeyboardItemCellViewModel.self)
        }
        
        let models = TestDataGenerator.KeyboardItemCellVMs()
        
        controller.storage.update {
            $0.add(models)
        }
        
        controller.attachSearchBar(searchFieldView.searchField)
        searchFieldView.delegate = self
    }
    
    func updateColorScheme(scheme: KeyboardColorScheme) {
        searchFieldKeyboard.updateColors(colorScheme: scheme)
    }
}

extension GDKeyboardView: SearchFieldViewDelegate {
    func didBeginEditing() {
        isInternalKeyboardHidded = false
    }
}

extension GDKeyboardView: SearchFieldKeyboardDelegate {
    
    func didSelectCharacter(character: String) {
        searchFieldView.textField?.insertText(character)
    }

    func didSelectSpace() {
        searchFieldView.textField?.insertText(" ")
    }
    
    func didSelectDelete() {
        searchFieldView.textField?.deleteBackward()
    }
    
    func didSelectClose() {
        isInternalKeyboardHidded = true
    }
}
