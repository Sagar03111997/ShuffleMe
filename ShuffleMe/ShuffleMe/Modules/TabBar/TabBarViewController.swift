//
//  TabBarViewController.swift
//  ShuffleMe
//
//  Created by Sagar Sahu on 11/11/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        changeRadiusOfTabBar()
    }
    
    func changeRadiusOfTabBar() {
        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent = true
        self.tabBar.layer.cornerRadius = 25
        
    }

}
