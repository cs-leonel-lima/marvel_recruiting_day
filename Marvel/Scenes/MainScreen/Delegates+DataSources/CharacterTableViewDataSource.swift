//
//  CharacterTableViewDataSource.swift
//  Marvel
//
//  Created by leonel.menezes.lima on 16/01/19.
//  Copyright © 2019 Thiago Lioy. All rights reserved.
//

import UIKit

final class CharacterTableViewDataSource: NSObject, UITableViewDataSource {
    
    let items: [Character]
    
    init(items: [Character], tableView: UITableView) {
        self.items = items
        super.init()
        setupTableView(tableView)
    }
    
    private func setupTableView(_ tableView: UITableView) {
        tableView.register(CharacterTableCell.self, forCellReuseIdentifier: CharacterTableCell.identifier)
        tableView.rowHeight = CharacterTableCell.height()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableCell.identifier, for: indexPath) as? CharacterTableCell else {
            return UITableViewCell()
        }
        let character = items[indexPath.row]
        cell.setup(item: character)
        return cell
    }
    
}
