//
//  CharacterTableViewDelegate.swift
//  Marvel
//
//  Created by leonel.menezes.lima on 16/01/19.
//  Copyright © 2019 Thiago Lioy. All rights reserved.
//

import UIKit

final class CharacterTableViewDelegate: NSObject, UITableViewDelegate {
    
    weak var characterSelectionDelegate: CharactersSelectionDelegate?
    
    let items: [Character]
    
    init(items: [Character], delegate: CharactersSelectionDelegate) {
        self.items = items
        self.characterSelectionDelegate = delegate
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = items[indexPath.item]
        self.characterSelectionDelegate?.didSelect(character: character)
    }
}
