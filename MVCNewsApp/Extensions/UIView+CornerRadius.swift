//
//  UIView+CornerRadius.swift
//  MVCNewsApp
//
//  Created by ibaikaa on 9/5/23.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        set { layer.cornerRadius = newValue }
        get { layer.cornerRadius }
    }
}
