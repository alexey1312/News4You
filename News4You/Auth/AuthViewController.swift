//
//  ViewController.swift
//  VKNewsFeed
//
//  Created by Admin on 17.11.2019.
//  Copyright © 2019 Aleksei Kakoulin. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    private var authService: AuthService!

    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var buttonSignIn: UIButton!

    @IBAction func buttonSignInTouch() {
        authService.wakeUpSession()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        //button
        setupButtonSignIn()

        //image
        imageLabel.backgroundColor = .clear

        authService = AppDelegate.shared().authService
        self.navigationController?.isNavigationBarHidden = true
    }

    private func setupButtonSignIn() {
        buttonSignIn.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        buttonSignIn.layer.cornerRadius = 10
        buttonSignIn.layer.shadowOpacity = 0.4
        buttonSignIn.layer.shadowOffset = CGSize(width: 2.5, height: 4)
    }
}
