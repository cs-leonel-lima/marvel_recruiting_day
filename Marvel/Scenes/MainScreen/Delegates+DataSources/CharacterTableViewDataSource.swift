//
//  CharacterTableViewDataSource.swift
//  Marvel
//
//  Created by leonel.menezes.lima on 16/01/19.
//  Copyright © 2019 Thiago Lioy. All rights reserved.
//

import UIKit

final class CharacterTableViewDataSource: NSObject, ItemsTableViewDatasource {
    var items:[Character] = []
    weak var tableView: UITableView?
    weak var delegate: UITableViewDelegate?
    
    required init(items: [Character], tableView: UITableView, delegate: UITableViewDelegate) {
        self.items = items
        self.tableView = tableView
        self.delegate = delegate
        super.init()
        self.tableView?.register(CharacterTableCell.self, forCellReuseIdentifier: CharacterTableCell.identifier)
        self.setupTableView()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableCell.identifier, for: indexPath) as? CharacterTableCell else {
            fatalError("Could not dequeue cell fom character type")
        }
        
        let character = self.items[indexPath.row]
        cell.setup(item: character)
        return cell
    }
    
    func updateItems(_ items: [Character]) {
        self.items = items
        self.tableView?.reloadData()
    }
    
    
}
