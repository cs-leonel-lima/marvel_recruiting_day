//
//  DetailViewController.swift
//  Marvel
//
//  Created by isabel.isaura.l.lima on 16/01/2019.
//  Copyright © 2019 Thiago Lioy. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    let screen = DetailViewControllerScreen()
    let character: Character
    
    override func loadView() {
        self.view = screen
    }

    init(character: Character) {
        self.character = character
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = character.name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen.setupView(with: character)
    }
}
