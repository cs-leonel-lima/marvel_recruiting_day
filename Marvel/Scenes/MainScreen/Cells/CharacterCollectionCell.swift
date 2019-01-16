//
//  CharacterCollectionCell.swift
//  Marvel
//
//  Created by isabel.isaura.l.lima on 16/01/2019.
//  Copyright © 2019 Thiago Lioy. All rights reserved.
//

import UIKit

class CharacterCollectionCell: UICollectionViewCell {
    
    let characterGridView = CharacterGridView()
    
    // Implement size cell
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        characterGridView.clean()
    }
    
}

extension CharacterCollectionCell: CodeView {
    func buildViewHierarchy() {
        addSubview(characterGridView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.characterGridView.topAnchor.constraint(equalTo: self.topAnchor),
            self.characterGridView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.characterGridView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.characterGridView.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
 
}

extension CharacterCollectionCell {
    
    //TODO: call the grid setup
    
    func setupGrid(with character: Character) {
        characterGridView.name.text = character.name
        characterGridView.image.image = UIImage(named: "mockImage")
        
        guard let path = character.thumbImage?.fullPath() else {
            return
        }
        characterGridView.image.download(image: path)
    }
}
