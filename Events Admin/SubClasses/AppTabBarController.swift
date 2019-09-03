//
//  AppTabBarController.swift
//  Events Admin
//
//  Created by Sarvad shetty on 9/3/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import UIKit

class AppTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTheming()
    }
}

extension AppTabBarController: Themed {
    func applyTheme(_ theme: AppTheme) {
        tabBar.barTintColor = theme.barBackgroundColor
        tabBar.tintColor = theme.barForegroundColor
    }
}
