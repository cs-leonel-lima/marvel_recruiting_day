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
        self.setupCollectionView()
    }
}

extension MainViewController {
    func setupTableView(with characters: [Character]) {
        screen.charactersTableView.updateItems(characters)
    }
    
    func setupCollectionView() {
        screen.charactersCollectionView.dataSource = self
        screen.charactersCollectionView.delegate = self
        screen.charactersCollectionView.register(CharacterCollectionCell.self, forCellWithReuseIdentifier: CharacterCollectionCell.cellIdentifier)
        screen.charactersCollectionView.reloadData()
    }
}


extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: UICollectionView Delegate and Datasource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionCell.cellIdentifier, for: indexPath) as? CharacterCollectionCell else { fatalError("Could not dequeue character collection cell") }
        
        let character = characters[indexPath.row]
        cell.setup(with: character)
        return cell
    }
    
    // MARK: FlowLayoutDelegate
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCells = CGFloat(2)
        let width = collectionView.bounds.size.width / numberOfCells
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
