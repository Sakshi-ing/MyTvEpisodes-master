//
//  TabBarViewController.swift
//  MyTvEpisodes
//
//  Created by mac os on 01/11/23.
//  Copyright © 2023 AtosSyntel. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    var favoritePageViewController: FavoritePage_ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let viewControllers = self.viewControllers, viewControllers.indices.contains(0) {
            favoritePageViewController = viewControllers[0] as? FavoritePage_ViewController
        }
    }

   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
