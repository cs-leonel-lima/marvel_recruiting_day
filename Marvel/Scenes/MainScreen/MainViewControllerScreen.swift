//
//  MainViewControllerScreen.swift
//  Marvel
//
//  Created by leonel.menezes.lima on 16/01/19.
//  Copyright © 2019 Thiago Lioy. All rights reserved.
//

import UIKit

final class MainViewControllerScreen: UIView {
    let charactersTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.showsCancelButton = true
        
        return searchBar
    }()
    
    init(){
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension MainViewControllerScreen: CodeView {
    
    func buildViewHierarchy() {
        self.addSubview(self.searchBar)
        self.addSubview(self.charactersTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.searchBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            ])
        
        NSLayoutConstraint.activate([
            self.charactersTableView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor),
            self.charactersTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.charactersTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.charactersTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
    
    func setupAdditionalConfiguration() {
        self.searchBar.isTranslucent = false
        self.searchBar.barTintColor = ColorPalette.black
        
    }
}

