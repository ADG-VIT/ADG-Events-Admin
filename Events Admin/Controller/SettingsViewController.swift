//
//  SettingsViewController.swift
//  Events Admin
//
//  Created by Sarvad shetty on 8/30/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var dkModeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpTheming()
        tapRecogSetup()
        setupShadow()
    }
    
    //MARK: - Functions
    func setupShadow() {
        dkModeView.layer.shadowColor = UIColor.black.cgColor
        dkModeView.layer.shadowOpacity = 0.2
        dkModeView.layer.shadowOffset = .zero
        dkModeView.layer.shadowRadius = 10
        dkModeView.layer.shadowPath = UIBezierPath(rect: dkModeView.bounds).cgPath
        dkModeView.layer.shouldRasterize = true
        dkModeView.layer.rasterizationScale = UIScreen.main.scale
        dkModeView.layer.cornerRadius = 7
        dkModeView.layer.masksToBounds = false
    }
    
    func tapRecogSetup() {
        
        let attendTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dkTapped))
        
        dkModeView.addGestureRecognizer(attendTapGesture)
        dkModeView.isUserInteractionEnabled = true
    }

    @objc func dkTapped() {
        themeProvider.nextTheme()
    }
}

extension SettingsViewController: Themed {
    func applyTheme(_ theme: AppTheme) {
        view.backgroundColor = theme.backgroundColor
        label.textColor = theme.barForegroundColor
        dkModeView.backgroundColor = theme.barBackgroundColor
    }
}
