//
//  ViewController.swift
//  MVCNewsApp
//
//  Created by ibaikaa on 22/4/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkLayer.shared.fetchNews()
    }


}

