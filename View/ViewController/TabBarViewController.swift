//
//  TabBarViewController.swift
//  MyTvEpisodes
//
//  Created by mac os on 01/11/23.
//  Copyright © 2023 AtosSyntel. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController,FavoriteViewControllerDelegate {
    
        
        func switchToFavoritePage() {
            self.selectedIndex = 0 
        }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let favoriteViewController = viewControllers?[0] as? FavoritePage_ViewController {
            favoriteViewController.delegate = self
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if shouldSwitchToFavoritePage {
            if let viewControllers = self.viewControllers, viewControllers.indices.contains(0) {
                
                self.selectedIndex = 0
            }
        }
    }
    
    
    var shouldSwitchToFavoritePage = false
}
    

