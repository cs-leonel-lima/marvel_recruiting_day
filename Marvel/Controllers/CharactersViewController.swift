//
//  CharactersViewController.swift
//  Marvel
//
//  Created by Thiago Lioy on 14/11/16.
//  Copyright © 2016 Thiago Lioy. All rights reserved.
//

import UIKit

class CharactersViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var tableViewDataSource: CharacterTableViewDataSource?

    var collectionViewDataSource: CharacterCollectionViewDataSource?
    var collectionViewDelegate: CharacterCollectionViewDelegate?
    
    let service: MarvelService = MarvelServiceImpl()
    var characters: [Character] = []
    
    public static func initFromStoryboard() -> CharactersViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle(for: self))
        guard let viewController =
            storyboard.instantiateViewController(withIdentifier:
                String(describing: CharactersViewController.self)) as? CharactersViewController else {
                fatalError("Could not load a viewcontroller for identifier CharactersViewController")
        }
        return viewController
    }
    
    fileprivate enum LoadingState {
        case loading
        case ready
    }
    
    fileprivate enum PresentationState {
        case list
        case grid
        case error
    }
    
    fileprivate var loadingState: LoadingState = .ready {
        didSet {
            switch loadingState {
            case .loading:
                activityIndicator.startAnimating()
            case .ready:
                activityIndicator.stopAnimating()
                
            }
        }
    }

    fileprivate var presentationState: PresentationState = .list {
        didSet {
            refreshUI(for: presentationState)
        }
        
    }
}

extension CharactersViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        fetchCharacters()
    }
}

extension CharactersViewController {
    fileprivate func refreshUI(for presentationState: PresentationState) {
        switch presentationState {
        case .list:
            tableView.isHidden = false
            collectionView.isHidden = true
        case .grid:
            tableView.isHidden = true
            collectionView.isHidden = false
        case .error:
            tableView.isHidden = true
            collectionView.isHidden = true
        }
    }
    
    func setupTableView(with items: [Character]) {
        tableViewDataSource = CharacterTableViewDataSource(items: characters,
                                                           tableView: tableView)
        tableView.dataSource = tableViewDataSource
        tableView.reloadData()
    }
    
    func setupCollectionView(with items: [Character]) {
        collectionViewDataSource = CharacterCollectionViewDataSource(items: characters,
                                                                     collectionView: collectionView)
        collectionViewDelegate = CharacterCollectionViewDelegate()
        
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = collectionViewDelegate
        collectionView.reloadData()
    }
}

extension CharactersViewController {
    func fetchCharacters(query: String? = nil) {
        loadingState = .loading
        service.fetchCharacters(query: query) { result in
            self.loadingState = .ready
            switch result {
            case .success(let characters):
                self.characters = characters
                self.setupTableView(with: characters)
                self.setupCollectionView(with: characters)
                self.refreshUI(for: self.presentationState)
            case .error(let error):
                print(error)
            }
        }
    }

}

extension CharactersViewController {
    @IBAction func showAsGrid(_ sender: UIButton) {
        presentationState = .grid
    }
    
    @IBAction func showAsTable(_ sender: UIButton) {
        presentationState = .list
    }
}


extension CharactersViewController: UISearchBarDelegate {
    func setupSearchBar() {
        self.searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let query = searchBar.text ?? ""
        if !query.isEmpty {
            fetchCharacters(query: query)
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

