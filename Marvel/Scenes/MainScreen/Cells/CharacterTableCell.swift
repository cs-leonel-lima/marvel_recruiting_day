//
//  CharacterTableCell.swift
//  Marvel
//
//  Created by leonel.menezes.lima on 16/01/19.
//  Copyright © 2019 Thiago Lioy. All rights reserved.
//

import UIKit

final class CharacterTableCell: UITableViewCell{
    
    let characterRowView: CharacterRowView = {
        let view = CharacterRowView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    static func height() -> CGFloat {
        return 80
    }
    
    static let identifier = "CharacterTableCell"
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup(item: Character) {
        if let url = item.thumbImage?.fullPath() {
            characterRowView.thumbImage.download(image: url)
        }
    }
}

extension CharacterTableCell: CodeView {
    func buildViewHierarchy() {
        addSubview(self.characterRowView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.characterRowView.topAnchor.constraint(equalTo: self.topAnchor),
            self.characterRowView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.characterRowView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.characterRowView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
    }
    
    func setupAdditionalConfiguration() {
        
    }
    
    
}
