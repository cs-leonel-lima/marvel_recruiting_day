//
//  CharactersCollection.swift
//  Marvel
//
//  Created by isabel.isaura.l.lima on 16/01/2019.
//  Copyright © 2019 Thiago Lioy. All rights reserved.
//

import UIKit

class CharactersCollectionView: UICollectionView {
    
    var didSelectCharacter: ((Character) -> Void)?
    
    var customDataSource: CharactersCollectionViewDataSource?
    lazy var customDelegate: CharacterCollectionViewDelegate = CharacterCollectionViewDelegate(delegate: self)
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        self.customDataSource = CharactersCollectionViewDataSource(items: [], collectionView: self, delegate: customDelegate)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateItems(characters: [Character]) {
        self.customDataSource?.updateItems(items: characters)
    }
    
}

extension CharactersCollectionView: CharactersSelectionDelegate {
    func didSelect(indexPath: IndexPath) {
        guard let selectionHandler = self.didSelectCharacter, let selectedCharacter = self.customDataSource?.items[indexPath.item] else { return }
        selectionHandler(selectedCharacter)
    }

}
