//
//  UIImageView+ScaleAspectFill.swift
//  MVCNewsApp
//
//  Created by ibaikaa on 1/5/23.
//

import UIKit

extension UIImageView {
    @IBInspectable var scaleAspectFill: Bool {
        set { contentMode = newValue ? .scaleAspectFill : .scaleAspectFit }
        get { self.scaleAspectFill }
    }
}
