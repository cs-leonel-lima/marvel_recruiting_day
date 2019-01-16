//
//  CharacterSelectionDelegate.swift
//  Marvel
//
//  Created by leonel.menezes.lima on 16/01/19.
//  Copyright © 2019 Thiago Lioy. All rights reserved.
//

import Foundation

protocol CharactersSelectionDelegate: class {
    func didSelect(character at: IndexPath)
}
