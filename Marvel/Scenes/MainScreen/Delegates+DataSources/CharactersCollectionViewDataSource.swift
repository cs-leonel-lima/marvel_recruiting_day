//
//  CharactersCollectionViewDataSource.swift
//  Marvel
//
//  Created by isabel.isaura.l.lima on 16/01/2019.
//  Copyright © 2019 Thiago Lioy. All rights reserved.
//

import UIKit

class CharactersCollectionViewDataSource: NSObject, ItemCollectionDataSource {
    
    var items: [Character]
    var delegate: UICollectionViewDelegate?
    var collectionView: UICollectionView?
    
    required init(items: [Character], collectionView: UICollectionView, delegate: UICollectionViewDelegate) {
        self.items = items
        self.collectionView = collectionView
        self.delegate = delegate
        super.init()
        self.collectionView?.register(CharacterCollectionCell.self, forCellWithReuseIdentifier: CharacterCollectionCell.cellIdentifier)
        self.setupCollectionView()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionCell.cellIdentifier, for: indexPath) as? CharacterCollectionCell else { fatalError("failed to dequeue character collection cell") }
        
        let character = items[indexPath.item]
        cell.setup(with: character)
        return cell
        
    }
    
    func updateItems(items: [Character]) {
        self.items = items
        self.collectionView?.reloadData()
    }
    
}
