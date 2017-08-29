//
//  Geometry.swift
//  Cropper
//
//  Created by Alex Burtnik on 4/6/17.
//  Copyright © 2017 alexburtnik. All rights reserved.
//

import Foundation
import UIKit

//MARK Points/Point addition

public func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

public func += (left: inout CGPoint, right: CGPoint) {
    left = left + right
}

public func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

public func -= (left: inout CGPoint, right: CGPoint) {
    left = left - right
}

//MARK Points/Vector addition

public func + (left: CGPoint, right: CGVector) -> CGPoint {
    return CGPoint(x: left.x + right.dx, y: left.y + right.dy)
}

public func += (left: inout CGPoint, right: CGVector) {
    left = left + right
}

public func - (left: CGPoint, right: CGVector) -> CGPoint {
    return CGPoint(x: left.x - right.dx, y: left.y - right.dy)
}

public func -= (left: inout CGPoint, right: CGVector) {
    left = left - right
}

//MARK Points multiplication

public func * (left: CGFloat, right: CGPoint) -> CGPoint {
    return CGPoint(x: right.x * left, y: right.y * left)
}

public func * (left: CGPoint, right: CGFloat) -> CGPoint {
    return CGPoint(x: left.x * right, y: left.y * right)
}

public func *= (left: inout CGPoint, right: CGFloat) {
    return left = left * right
}


public func / (left: CGPoint, right: CGFloat) -> CGPoint {
    return left * (1.0 / right)
}

public func /= (left: inout CGPoint, right: CGFloat) {
    return left = left / right
}

//MARK Size multiplication

public func * (left: CGSize, right: CGFloat) -> CGSize {
    return CGSize(width: left.width * right, height: left.height * right)
}

public func / (left: CGSize, right: CGFloat) -> CGSize {
    return left * (1.0 / right)
}

//MARK Vectors addition

public func + (left: CGVector, right: CGVector) -> CGVector {
    return CGVector(dx: left.dx + right.dx, dy: left.dy + right.dy)
}

public func += (left: inout CGVector, right: CGVector) {
    left = left + right
}

public func - (left: CGVector, right: CGVector) -> CGVector {
    return CGVector(dx: left.dx - right.dx, dy: left.dy - right.dy)
}

public func -= (left: inout CGVector, right: CGVector) {
    left = left - right
}

//MARK Vectors multiplication

public func * (left: CGFloat, right: CGVector) -> CGVector {
    return CGVector(dx: right.dx * left, dy: right.dy * left)
}

public func * (left: CGVector, right: CGFloat) -> CGVector {
    return CGVector(dx: left.dx * right, dy: left.dy * right)
}

public func *= (left: inout CGVector, right: CGFloat) {
    return left = left * right
}


public func / (left: CGVector, right: CGFloat) -> CGVector {
    return left * (1.0 / right)
}

public func /= (left: inout CGVector, right: CGFloat) {
    return left = left / right
}

//MARK Rect + Vector

public func + (left: CGRect, right: CGVector) -> CGRect {
    return CGRect(origin: left.origin + right, size: left.size)
}

public func += (left: inout CGRect, right: CGVector) {
    return left = left + right
}

public func - (left: CGRect, right: CGVector) -> CGRect {
    return CGRect(origin: left.origin - right, size: left.size)
}

public func -= (left: inout CGRect, right: CGVector) {
    return left = left - right
}



