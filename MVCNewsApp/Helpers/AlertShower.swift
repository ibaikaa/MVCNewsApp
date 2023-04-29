//
//  AlertShower.swift
//  MVCNewsApp
//
//  Created by ibaikaa on 23/4/23.
//

import UIKit

final class AlertShower {
    static func showAlert(title: String, message: String, for vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        vc.present(alert, animated: true)
    }
}
