//
//  CharactersCollectionViewDataSource.swift
//  Marvel
//
//  Created by isabel.isaura.l.lima on 16/01/2019.
//  Copyright © 2019 Thiago Lioy. All rights reserved.
//

import UIKit

class CharactersCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    var characters: [Character]
    
    weak var collectionView: UICollectionView?
    weak var delegate: UICollectionViewDelegate?
    
    init(characters: [Character], collectionView: UICollectionView, delegate: UICollectionViewDelegate) {
        self.characters = characters
        self.collectionView = collectionView
        self.delegate = delegate
        
        self.collectionView?.register(CharacterCollectionCell.self, forCellWithReuseIdentifier: CharacterCollectionCell.cellIdentifier)
        self.collectionView?.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionCell.cellIdentifier, for: indexPath) as? CharacterCollectionCell else { fatalError("Could not dequeue character collection cell") }
        
        let character = characters[indexPath.row]
        cell.setup(with: character)
        
        return cell
    }
    
    func updateCollectionView(_ characters: [Character]) {
        self.characters = characters
        self.collectionView?.reloadData()
    }
    
}
