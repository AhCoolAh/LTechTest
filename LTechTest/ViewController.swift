//
//  ViewController.swift
//  LTechTest
//
//  Created by Pavel21 on 08.11.2022.
//

import UIKit

class ViewController: UIViewController {

    let loginViewController = LoginViewController()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        guard let storyboard = storyboard else { return }
        
        let loginViewController = storyboard.instantiateViewController(identifier: "loginSegue")
        present(loginViewController, animated: false)
    }
}

