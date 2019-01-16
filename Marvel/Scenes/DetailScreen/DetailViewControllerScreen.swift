//
//  DetailViewControllerScreen.swift
//  Marvel
//
//  Created by isabel.isaura.l.lima on 16/01/2019.
//  Copyright © 2019 Thiago Lioy. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewControllerScreen: UIView {
    
    let characterImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    let descriptionText: UILabel = {
        let txt = UILabel()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.numberOfLines = 0
        txt.textColor = ColorPalette.white
        txt.textAlignment = .left
        return txt
    }()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
}


extension DetailViewControllerScreen: CodeView {
    func buildViewHierarchy() {
        addSubview(characterImageView)
        addSubview(descriptionText)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.characterImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.characterImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.characterImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.characterImageView.heightAnchor.constraint(equalToConstant: 350)
            ])
        
        NSLayoutConstraint.activate([
            self.descriptionText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.descriptionText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.descriptionText.topAnchor.constraint(equalTo: self.characterImageView.bottomAnchor, constant: 40)
            ])
        
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = ColorPalette.black

    }
    
}

extension DetailViewControllerScreen {
    
    func setupView(with character: Character) {
        descriptionText.text = character.bio
//        guard let path = character.thumbImage?.fullPath() else {
//            return
//        }
        characterImageView.image = character.image
        
        
    }
    
}
