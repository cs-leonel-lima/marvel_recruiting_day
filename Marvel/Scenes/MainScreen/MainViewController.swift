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
    
    let characters = [Character(name: "The one above all", bio: "Também conhecido como boss, ou Fernando de la Riva, este ser tem a responsabilidade de controlar as realidades do multiverso dos concreters", id: 9999, mockImage: #imageLiteral(resourceName: "theoneaboveall")), Character(name: "Super Lioy", bio: "Possui capacidades de modularizar delegates e datasources como os antigos heremitas.", id: 12311, mockImage: #imageLiteral(resourceName: "super-lioy")), Character(name: "Super Jonas", bio: "Sorrateiro como os ninjas da antiguidade, tem uma habilidade nata de se esconder de Happy Hours", id: 12311, mockImage: #imageLiteral(resourceName: "super-jonas")), Character(name: "Super Igarashi", bio: "Lendario Samurai, defensor das boas práticas e de processos ágeis", id: 12311, mockImage: #imageLiteral(resourceName: "super-igarashi")), Character(name: "Huallyd", bio: "Garoto Prodígio vindo de terras distantes, ainda não se conhece o tamanho de suas habilidades.", id: 12311, mockImage: #imageLiteral(resourceName: "super-huallyd")), Character(name: "Rodrigo Cavalcante", bio: "Nada é o que parece, ele tem o poder de testar as camadas do que você pode ver, ou o que você acha que vê", id: 12311, mockImage: #imageLiteral(resourceName: "super-rodrigo"))]
    
    
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
