//
//  UIViewExtension.swift
//  Test
//
//  Created by Mohamed Ali BELHADJ on 2022-01-20.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {return cornerRadius}
        set{ self.layer.cornerRadius = newValue }
    }
}
