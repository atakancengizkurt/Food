//
//  MainTabBarController.swift
//  Food
//
//  Created by Ali Emre Değirmenci on 28.02.2019.
//  Copyright © 2019 Ali Emre Değirmenci. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let viewControllers = viewControllers else {
            return
        }
        
        for viewController in viewControllers {
            
            if let profileNavigationController = viewController as? MainNavigationController {
                
                if (profileNavigationController.viewControllers.first as? MainViewController) != nil {
                    
                }
                
            }
        }
        
    }
}
