//
//  KeyboardItemCell.swift
//  GoogleDriveKeyboard
//
//  Created by Alexander Kravchenko on 9/12/18.
//  Copyright © 2018 ANODA. All rights reserved.
//

import UIKit
import AlisterSwift
import SnapKit
import Kingfisher

class KeyboardItemCellViewModel: ViewModelInterface {
    var itemURL: String
    var itemName: String
    
    var searchEvaluation: SearchEval? {
        let searchClosure: SearchEval = { [unowned self] text, _ in
            return self.itemName.uppercased().contains(text.uppercased())
        }
        return searchClosure
    }
    
    init(name: String, url: String) {
        self.itemName = name
        self.itemURL = url
    }
}

class KeyboardItemCell: UICollectionViewCell, ReusableViewInterface {
    
    private let contentImageView = UIImageView()
    private let nameLabel = UILabel()
    
    let generator = UIImpactFeedbackGenerator()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        let tapGR = UITapGestureRecognizer(target: self,
                                           action: #selector(copyItem))
        addGestureRecognizer(tapGR)
        
        contentView.addSubview(contentImageView)
        contentImageView.clipsToBounds = true
        contentImageView.layer.cornerRadius = 5
        contentImageView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        contentImageView.addSubview(nameLabel)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        nameLabel.textColor = .white
        nameLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    func update(_ model: ViewModelInterface) {
        guard let viewModel = model as? KeyboardItemCellViewModel else { return }
        contentImageView.kf.setImage(with: URL(string: viewModel.itemURL), placeholder: #imageLiteral(resourceName: "default-img-placeholder"))
        nameLabel.text = viewModel.itemName
    }
    
    @objc
    private func copyItem() {
        let itemName = nameLabel.text
        nameLabel.text = "Copied!"
        
        UIPasteboard.general.image = contentImageView.image
        generator.impactOccurred()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.nameLabel.text = itemName
        }
    }
}
