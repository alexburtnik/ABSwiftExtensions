//
//  UITextView+Extensions.swift
//  Pods
//
//  Created by Alex Burtnik on 8/31/17.
//
//

import Foundation
import UIKit

public extension UITextView {
    public var isEmpty: Bool {
        return text == nil || text.isEmpty
    }
}
