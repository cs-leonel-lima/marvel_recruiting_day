//
//  CharacterTableViewDelegate.swift
//  Marvel
//
//  Created by leonel.menezes.lima on 16/01/19.
//  Copyright © 2019 Thiago Lioy. All rights reserved.
//

import UIKit

final class CharacterTableViewDelegate: NSObject, UITableViewDelegate {
    
    let delegate: CharactersSelectionDelegate
    
    init(_ delegate: CharactersSelectionDelegate) {
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CharacterTableCell.height()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didSelect(character: indexPath)
    }
}
