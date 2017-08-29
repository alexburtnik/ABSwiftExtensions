//
//  CoreGraphics+Description.swift
//  Croppy
//
//  Created by Alex Burtnik on 8/29/17.
//  Copyright © 2017 alexburtnik. All rights reserved.
//

import Foundation
import UIKit

extension CGRect {
    var shortDescription: String {
        return "\(origin.shortDescription); \(size.shortDescription)"
    }
}

extension CGPoint {
    var shortDescription: String {
        return "\(x.shortDescription), \(y.shortDescription))"
    }
}

extension CGSize {
    var shortDescription: String {
        return "\(width.shortDescription), \(height.shortDescription)"
    }
}

extension CGVector {
    var shortDescription: String {
        return "\(dx.shortDescription), \(dy.shortDescription)"
    }
}

extension CGFloat {
    var shortDescription: String {
        return String(format: "%.3f", self)
    }
}
