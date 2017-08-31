//
//  Helpers.swift
//  Cropper
//
//  Created by Alex Burtnik on 4/23/17.
//  Copyright © 2017 alexburtnik. All rights reserved.
//

import Foundation
import UIKit

public func trim<T: Comparable>(_ value: T, from: T, to: T) -> T {
    return min(max(value, from), to)
}

public func trim<T: Comparable>(_ value: T, range: ClosedRange<T>) -> T {
    return trim(value, from: range.lowerBound, to: range.upperBound)
}

public func intersect<T: Comparable>(_ range1: ClosedRange<T>, _ range2: ClosedRange<T>) -> ClosedRange<T> {
    return max(range1.lowerBound, range2.lowerBound)...min(range1.upperBound, range2.upperBound)
}

public extension Integer {
    func sign() -> Self {
        return (self < 0 ? -1 : 1)
    }
}

public extension FloatingPoint {
    func sign() -> Self {
        return (self < Self(0) ? -1 : 1)
    }
}


