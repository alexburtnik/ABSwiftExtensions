//
//  CoreGraphics+Description.swift
//  Croppy
//
//  Created by Alex Burtnik on 8/29/17.
//  Copyright © 2017 alexburtnik. All rights reserved.
//

import Foundation
import UIKit

public extension CGRect {
    public var shortDescription: String {
        return "\(origin.shortDescription); \(size.shortDescription)"
    }
}

public extension CGPoint {
    public var shortDescription: String {
        return "\(x.shortDescription), \(y.shortDescription))"
    }
}

public extension CGSize {
    public var shortDescription: String {
        return "\(width.shortDescription), \(height.shortDescription)"
    }
}

public extension CGVector {
    public var shortDescription: String {
        return "\(dx.shortDescription), \(dy.shortDescription)"
    }
}

public extension CGFloat {
    public var shortDescription: String {
        return String(format: "%.3f", self)
    }
}
