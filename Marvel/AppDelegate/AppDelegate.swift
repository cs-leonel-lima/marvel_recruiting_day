//
//  AppDelegate.swift
//  Marvel
//
//  Created by Thiago Lioy on 14/11/16.
//  Copyright © 2016 Thiago Lioy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        ApperanceProxyHelper.customizeNavigationBar()
        self.setupWindow()
        return true
    }

}

extension AppDelegate {
    func setupWindow() {
        self.window = UIWindow()
        self.window?.makeKeyAndVisible()
        let navController = UINavigationController(rootViewController: MainViewController())
        setupNavigationBar(navBar: navController.navigationBar)
        window?.rootViewController = navController
    }
    
    func setupNavigationBar(navBar: UINavigationBar) {
        navBar.isTranslucent = false
        navBar.barTintColor = ColorPalette.red
    }
}
