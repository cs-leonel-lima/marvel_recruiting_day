//
//  ItemCollectionDataSource.swift
//  Marvel
//
//  Created by isabel.isaura.l.lima on 17/01/2019.
//  Copyright © 2019 Thiago Lioy. All rights reserved.
//

import UIKit

protocol ItemCollectionDataSource: UICollectionViewDataSource {
    associatedtype T
    
    var items: [T] {get}
    var delegate: UICollectionViewDelegate? {get}
    var collectionView: UICollectionView? {get}
    
    init(items: [T], collectionView: UICollectionView, delegate: UICollectionViewDelegate)
    
//    func setupColllectionView()
}

extension ItemCollectionDataSource {
    
    func setupCollectionView() {
        self.collectionView?.delegate = delegate
        self.collectionView?.dataSource = self
        self.collectionView?.reloadData()
    }
}
