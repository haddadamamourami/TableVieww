//
//  UIViewExtension.swift
//  Test
//
//  Created by Mohamed Ali BELHADJ on 2022-01-20.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {return self.cornerRadius}
        set{ self.layer.cornerRadius = newValue }
    }
}
extension String
{
    static func className(_ aClass: AnyClass) -> String
    {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
}


public extension UICollectionViewCell
{
    static var reuseIdentifier: String
    {
        return String(describing: self)
    }
}

public extension UITableViewCell
{
    static var reuseIdentifier: String
    {
        return String(describing: self)
    }
}

public extension UICollectionView
{
    
    func registerCellClass(_ cellClass: AnyClass)
    {
        let identifier = String.className(cellClass)
        self.register(cellClass, forCellWithReuseIdentifier: identifier)
    }
    
    func registerCellNib(_ cellClass: AnyClass)
    {
        let identifier = String.className(cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: identifier)
    }
    func reloadData(_ completion: @escaping () -> Void)
    {
        reloadData()
        DispatchQueue.main.async { completion() }
    }
}

