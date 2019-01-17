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
    
    let characters = [Character(name: "Coisa", bio: "bixo vei de predra", id: 3123, mockImage: #imageLiteral(resourceName: "mockImage")), Character(name: "Thor", bio: "Deus boiolinha", id: 12311, mockImage: #imageLiteral(resourceName: "mockImage")), Character(name: "Thor", bio: "Deus boiolinha", id: 12311, mockImage: #imageLiteral(resourceName: "mockImage")), Character(name: "Thor", bio: "Deus boiolinha", id: 12311, mockImage: #imageLiteral(resourceName: "mockImage")), Character(name: "Thor", bio: "Deus boiolinha", id: 12311, mockImage: #imageLiteral(resourceName: "mockImage")), Character(name: "Thor", bio: "Deus boiolinha", id: 12311, mockImage: #imageLiteral(resourceName: "mockImage")), Character(name: "Thor", bio: "Deus boiolinha", id: 12311, mockImage: #imageLiteral(resourceName: "mockImage")), Character(name: "Thor", bio: "Deus boiolinha", id: 12311, mockImage: #imageLiteral(resourceName: "mockImage"))]
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.screen.charactersTableView.updateItems(characters)
        self.screen.charactersCollectionView.updateItems(characters: characters)
    }
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = screen
        self.setupNavigationItems()
    }
    
    override func viewDidLoad() {
        self.title = "Characters"
        self.setupTableView(with: self.characters)
        self.setupCollectionView(with: self.characters)
        self.screen.charactersTableView.didSelectCharacter = self.navigateToCharacterScreen
        self.screen.charactersCollectionView.didSelectCharacter = self.navigateToCharacterScreen
        
    }
    
    func setupNavigationItems() {
        let gridButton = UIBarButtonItem(image: #imageLiteral(resourceName: "GridIcon"), style: .plain, target: self, action: #selector(toggleCollection)) // target seria self mesmo?
        let listbutton = UIBarButtonItem(image: #imageLiteral(resourceName: "ListIcon"), style: .plain, target: self, action: #selector(toggleTable))
        self.navigationItem.setRightBarButtonItems([gridButton, listbutton], animated: true)
    }
    
    @objc func toggleCollection() {
        self.screen.displayMode = .grid
    }
    
    @objc func toggleTable() {
        self.screen.displayMode = .list
    }
}

extension MainViewController {
    
    func navigateToCharacterScreen(with character: Character) {
        guard let navigationController = self.navigationController else { return }
        navigationController.pushViewController(DetailViewController(character: character), animated: true)
    }
    
}

extension MainViewController {
    func setupTableView(with characters: [Character]) {
        screen.charactersTableView.updateItems(characters)
    }
    
    func setupCollectionView(with characters: [Character]) {
        screen.charactersCollectionView.updateItems(characters: characters)
    }
}
