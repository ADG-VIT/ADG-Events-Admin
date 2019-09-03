//
//  AdminHomeViewController.swift
//  Events Admin
//
//  Created by Sarvad shetty on 8/30/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import UIKit
import AVFoundation

class AdminHomeViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var attendaneView: UIView!
    @IBOutlet weak var foodCouponView: UIView!
    @IBOutlet weak var attendLabel: UILabel!
    @IBOutlet weak var fcLabel: UILabel!
    

    //MARK: - Main function
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpTheming()
        tapRecogSetup()
        setupShadow()
    }
    
    //MARK: - Functions
    func setupShadow() {
        attendaneView.layer.shadowColor = UIColor.black.cgColor
        attendaneView.layer.shadowOpacity = 0.2
        attendaneView.layer.shadowOffset = .zero
        attendaneView.layer.shadowRadius = 10
        attendaneView.layer.shadowPath = UIBezierPath(rect: attendaneView.bounds).cgPath
        attendaneView.layer.shouldRasterize = true
        attendaneView.layer.rasterizationScale = UIScreen.main.scale
        attendaneView.layer.cornerRadius = 7
        attendaneView.layer.masksToBounds = false
        
        foodCouponView.layer.shadowColor = UIColor.black.cgColor
        foodCouponView.layer.shadowOpacity = 0.2
        foodCouponView.layer.shadowOffset = .zero
        foodCouponView.layer.shadowRadius = 10
        foodCouponView.layer.shadowPath = UIBezierPath(rect: attendaneView.bounds).cgPath
        foodCouponView.layer.shouldRasterize = true
        foodCouponView.layer.rasterizationScale = UIScreen.main.scale
        foodCouponView.layer.cornerRadius = 7
        foodCouponView.layer.masksToBounds = false
    }
    
    func tapRecogSetup() {
        
        let attendTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.attendTapped))
        let fdCoupTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.fdCoupTapped))
        
        attendaneView.addGestureRecognizer(attendTapGesture)
        attendaneView.isUserInteractionEnabled = true
        
        foodCouponView.addGestureRecognizer(fdCoupTapGesture)
        foodCouponView.isUserInteractionEnabled = true
    }
    
    //MARK: - @objc functions
    @objc func attendTapped() {
        print("attend tapped")
        //switch to scanner view
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "BarcodeAndQrViewController") as? BarcodeAndQrViewController else { fatalError("couldnt init vc") }
        vc.scanType = .attendance
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func fdCoupTapped() {
        print("fd tapped")
        //switch to scanner view
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "BarcodeAndQrViewController") as? BarcodeAndQrViewController else { fatalError("couldnt init vc") }
        vc.scanType = .food
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

extension AdminHomeViewController: Themed {
    func applyTheme(_ theme: AppTheme) {
        view.backgroundColor = theme.backgroundColor
        foodCouponView.backgroundColor = theme.barBackgroundColor
        fcLabel.textColor = theme.barForegroundColor
        attendaneView.backgroundColor = theme.barBackgroundColor
        attendLabel.textColor = theme.barForegroundColor
        
    }
}
