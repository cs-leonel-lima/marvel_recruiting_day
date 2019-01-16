//
//  CharacterRowView.swift
//  Marvel
//
//  Created by leonel.menezes.lima on 16/01/19.
//  Copyright © 2019 Thiago Lioy. All rights reserved.
//

import UIKit

final class CharacterRowView: UIView {
    
    let thumbImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        title.textAlignment = .center
        return title
    }()
    
    let overviewlabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension CharacterRowView: CodeView {
    func buildViewHierarchy() {
        self.addSubview(thumbImage)
        self.addSubview(titleLabel)
        self.addSubview(overviewlabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
                self.thumbImage.topAnchor.constraint(equalTo: self.topAnchor),
                self.thumbImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                self.thumbImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                self.thumbImage.widthAnchor.constraint(equalToConstant: 70)
            ])
        
        NSLayoutConstraint.activate([
                self.titleLabel.leadingAnchor.constraint(equalTo: self.thumbImage.trailingAnchor, constant: 10),
                self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
                self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
                self.titleLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
                self.overviewlabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10),
                self.overviewlabel.leadingAnchor.constraint(equalTo: self.thumbImage.trailingAnchor, constant: 10),
                self.overviewlabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
                self.overviewlabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
            ])
    }
    
    func setupAdditionalConfiguration() {
        titleLabel.textColor = .white
        overviewlabel.textColor = .white
        backgroundColor = ColorPalette.black
    }
    
    
}
