//
//  CharacterGridView.swift
//  Marvel
//
//  Created by isabel.isaura.l.lima on 16/01/2019.
//  Copyright © 2019 Thiago Lioy. All rights reserved.
//

import UIKit
import SDWebImage

final class CharacterGridView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let image: UIImageView = {
        let img = UIImageView(frame: .zero)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let name: UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = ColorPalette.white
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let footer: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorPalette.black
        view.alpha = 0.8
        return view
    }()
    
    func clean() {
        image.image = nil
        name.text = ""
    }
    
    func setup(_ character: Character) {
        // TODO: Use actual API path to download correct image
        image.image = UIImage(named: "mockImage")
        name.text = character.name
    }
    
}

extension CharacterGridView: CodeView {
    func buildViewHierarchy() {
        addSubview(image)
        addSubview(footer)
        addSubview(name)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.image.topAnchor.constraint(equalTo: self.topAnchor),
            self.image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.image.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.image.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
        
        NSLayoutConstraint.activate([
            self.footer.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.footer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.footer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.footer.heightAnchor.constraint(equalToConstant: 30)])
        
        NSLayoutConstraint.activate([
            self.name.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2),
            self.name.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.name.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5)])
    }
    
    
}
