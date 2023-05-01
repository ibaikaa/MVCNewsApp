//
//  UIImageView+CornerRadius.swift
//  MVCNewsApp
//
//  Created by ibaikaa on 1/5/23.
//

import UIKit

extension UIImageView {
    @IBInspectable var cornerRadius: CGFloat {
        set { layer.cornerRadius = newValue }
        get { layer.cornerRadius }
    }
}
