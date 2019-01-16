//
//  MainViewScene.swift
//  Marvel
//
//  Created by leonel.menezes.lima on 16/01/19.
//  Copyright © 2019 Thiago Lioy. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let screen = MainViewControllerScreen()
    
    let characters = [Character(name: "Coisa", bio: "bixo vei de predra", id: 3123, mockImage: #imageLiteral(resourceName: "mockImage")), Character(name: "Thor", bio: "Deus boiolinha", id: 12311, mockImage: #imageLiteral(resourceName: "mockImage"))]
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.screen.charactersTableView.updateItems(characters)
    }
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = screen
    }
    
    override func viewDidLoad() {
        self.title = "Characters"
        self.setupTableView(with: self.characters)
    }
}

extension MainViewController {
    func setupTableView(with characters: [Character]){
        screen.charactersTableView.updateItems(characters)
    }
}
