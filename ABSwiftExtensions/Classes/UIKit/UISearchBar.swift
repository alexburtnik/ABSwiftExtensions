//
//  UISearchBar.swift
//  Pods
//
//  Created by Alex Burtnik on 8/31/17.
//
//

import Foundation

public extension UISearchBar {
    public var isEmpty: Bool {
        return text == nil || text!.isEmpty
    }
}
