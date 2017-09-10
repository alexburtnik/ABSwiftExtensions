//
//  UIBarButtonItem+Extensions.swift
//  Pods
//
//  Created by Alex Burtnik on 8/31/17.
//
//

import Foundation

public extension UIBarButtonItem {
    public convenience init(image: UIImage, color : UIColor = .white, target: Any?, action: Selector?) {
        self.init(image: image, style: .plain, target: target, action: action)
        self.tintColor = color
    }
    
    public static func buttonItem(title: String, color: UIColor?, font: UIFont? = nil, titleColor: UIColor? = .white, target: Any?, action: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.backgroundColor = color
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = font ?? UIFont.systemFont(ofSize: 14)
        button.setTitleColor(titleColor, for: .normal)
        
        var size = button.sizeThatFits(CGSize(width: 100, height: 35))
        size.width += 30
        button.frame = CGRect(origin: .zero, size: size)
        
        button.cornerRadius = 5
        button.addTarget(target, action: action, for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
}
