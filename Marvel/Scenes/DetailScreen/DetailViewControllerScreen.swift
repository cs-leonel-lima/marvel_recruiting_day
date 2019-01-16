//
//  DetailViewControllerScreen.swift
//  Marvel
//
//  Created by isabel.isaura.l.lima on 16/01/2019.
//  Copyright © 2019 Thiago Lioy. All rights reserved.
//

import UIKit

class DetailViewControllerScreen: UIView {
    
    let characterImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .center
        return view
    }()
    
    //Adicionar image view
    //Adicionar navbar
    //Adicionar Label de descrição
    //Mudar background color
    
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
    }
    
    func setupConstraints() {
        
    }
    
    func setupAdditionalConfiguration() {
       backgroundColor = ColorPalette.black
    }
    
    
}
