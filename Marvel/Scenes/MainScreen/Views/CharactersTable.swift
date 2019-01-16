//
//  CharactersTable.swift
//  Marvel
//
//  Created by leonel.menezes.lima on 16/01/19.
//  Copyright © 2019 Thiago Lioy. All rights reserved.
//

import UIKit

final class CharactersTable: UITableView {
    
    var didSelectCharacter: ((Character) -> ())?
    
    var items: [Character] = []
    
    var customDataSource: CharacterTableViewDataSource?
    var customDelegate: CharacterTableViewDelegate?
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.backgroundColor = ColorPalette.black
//        self.customDelegate = CharacterTableViewDelegate(items: items, delegate: self) -> Averiguar essa linha, provavelmente vou precisar de um metodo setup para configurar o datasource e o delegate.
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CharactersTable {
    func updateItems(_ items: [Character]) {
        customDataSource?.update(with: items, handler: {
            reloadData()
        })
    }
}

extension CharactersTable: CharactersSelectionDelegate {
    func didSelect(character: Character) {
        if let handler = self.didSelectCharacter {
            handler(character)
        }
    }
}
