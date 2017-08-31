//
//  UIScreen.swift
//  Pods
//
//  Created by Alex Burtnik on 8/31/17.
//
//

import Foundation
import UIKit

public extension UIScreen {
    public static var size: CGSize { return UIScreen.main.bounds.size }
    public static var width: CGFloat { return size.width }
    public static var height: CGFloat { return size.height }
}
