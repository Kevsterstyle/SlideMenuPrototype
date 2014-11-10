//
//  NavigationController.swift
//  SlideMenuPrototype
//
//  Created by Kevin Frei on 29.10.14.
//  Copyright (c) 2014 Team Project. All rights reserved.
//
//
//
//  Used ENSwiftSideMenu: https://github.com/evnaz/ENSwiftSideMenu Created by Evgeny on 24.07.14.
//  Copyright (c) 2014 Evgeny Nazarov. All rights reserved.
//

import UIKit

class NavigationController: ENSideMenuNavigationController, ENSideMenuDelegate {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenu = ENSideMenu(sourceView: self.view, menuTableViewController: MenuTableViewController(), menuPosition:.Left)
        sideMenu?.delegate = self //optional
        sideMenu?.menuWidth = 160.0 // default is 160
      
        
        // make navigation bar showing over side menu
        view.bringSubviewToFront(navigationBar)
    }
    
    // MARK: - ENSideMenu Delegate
    func sideMenuWillOpen() {
        println("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        println("sideMenuWillClose")
    }
    
        
    
}
