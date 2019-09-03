//
//  AppNavigationController.swift
//  Events Admin
//
//  Created by Sarvad shetty on 9/3/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import Foundation

import UIKit

class AppNavigationController: UINavigationController {
    private var themedStatusBarStyle: UIStatusBarStyle?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return themedStatusBarStyle ?? super.preferredStatusBarStyle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTheming()
    }
}

extension AppNavigationController: Themed {
    func applyTheme(_ theme: AppTheme) {
        themedStatusBarStyle = theme.statusBarStyle
        setNeedsStatusBarAppearanceUpdate()
        
        navigationBar.barTintColor = theme.barBackgroundColor
        navigationBar.tintColor = theme.barForegroundColor
        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: theme.barForegroundColor
        ]
    }
}
