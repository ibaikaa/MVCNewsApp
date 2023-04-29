//
//  UITextField+Toolbar.swift
//  MVCNewsApp
//
//  Created by ibaikaa on 23/4/23.
//

import UIKit

extension UITextField {
    @IBInspectable var toolBarOn: Bool {
        get { self.toolBarOn }
        set { setToolbar() }
    }
    
    func setToolbar() {
        let toolbar = UIToolbar(
            frame: CGRect(
                x: 0,
                y: 0,
                width: UIScreen.main.bounds.width,
                height: 35
            )
        )
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.items = [
            UIBarButtonItem(
                barButtonSystemItem: .flexibleSpace,
                target: nil,
                action: nil
            ),
            
            UIBarButtonItem(
                title: "Done",
                style: .done,
                target: self,
                action: #selector(doneButtonTapped)
            )
        ]
        
        toolbar.barTintColor = .systemGray6
        
        toolbar.sizeToFit()
        self.inputAccessoryView = toolbar
    }
    
    @objc private func doneButtonTapped() {
        self.resignFirstResponder()
    }
    
    
}
