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
    

    //MARK: - Main function
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func fdCoupTapped() {
        print("fd tapped")
        //switch to scanner view
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "BarcodeAndQrViewController") as? BarcodeAndQrViewController else { fatalError("couldnt init vc") }
        vc.scanType = .food
        self.present(vc, animated: true, completion: nil)
    }

}
