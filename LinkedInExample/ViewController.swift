//
//  ViewController.swift
//  LinkedInExample
//
//  Created by Jose Manuel Solis Bulos on 4/4/19.
//  Copyright © 2019 manuelbulos. All rights reserved.
//

import UIKit
import LinkedInSignIn

class ViewController: UIViewController {

    @IBOutlet weak var tokenLabel: UILabel!

    let linkedinCredentilas = [
        "linkedInKey": "86vc2gu9e4mb9l",
        "linkedInSecret": "t68q6OYj9Rvcnswp",
        "redirectURL": "https://com.appcoda.linkedin.oauth/oauth"
    ]

    @objc func login() {
        let linkedInConfig = LinkedInConfig(linkedInKey: linkedinCredentilas["linkedInKey"]!,
                                            linkedInSecret: linkedinCredentilas["linkedInSecret"]!,
                                            redirectURL: linkedinCredentilas["redirectURL"]!)

        let linkedInHelper = LinkedinHelper(linkedInConfig: linkedInConfig)


        linkedInHelper.login(from: self, completion: { [weak self] (accessToken) in
            self?.tokenLabel.text = accessToken
        }, failure: { (error) in
            print(error.localizedDescription)
        }) {
            print("cancelled")
        }
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        login()
    }
}
