//
//  DetailViewController.swift
//  Marvel
//
//  Created by isabel.isaura.l.lima on 16/01/2019.
//  Copyright © 2019 Thiago Lioy. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    let screen = DetailViewControllerScreen()
    
    override func loadView() {
        self.view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
