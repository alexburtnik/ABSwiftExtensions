//
//  Geometry.swift
//  Cropper
//
//  Created by Alex Burtnik on 4/12/17.
//  Copyright © 2017 alexburtnik. All rights reserved.
//

import Foundation
import UIKit

struct Circle {
    var center: CGPoint
    var radius: CGFloat
    
    func vectorToRect(_ rect: CGRect) -> CGVector? {
        guard round(rect.width - 2 * radius) >= 0 && round(rect.height - 2 * radius) >= 0 else { return nil }
        return center.vectorToRect(rect.insetBy(dx: radius, dy: radius))        
    }
}

struct Segment {
    var start: CGPoint
    var end: CGPoint
    
    init(start: CGPoint, end: CGPoint) {
        self.start = start
        self.end = end
    }
    
    init(startX: CGFloat, startY: CGFloat, endX: CGFloat, endY: CGFloat) {
        self.init(start: CGPoint(x: startX, y: startY), end: CGPoint(x: endX, y: endY))
    }
    
    var lengthSquared: CGFloat {
        return start.distanceSquared(toPoint: end)
    }
    
    var length: CGFloat {
        return start.distance(toPoint: end)
    }
    
    var vector: CGVector {
        return start.vectorToPoint(end)
    }
}

extension CGPoint {
    
    func distanceSquared(toPoint point: CGPoint) -> CGFloat {
        return pow(x - point.x, 2) + pow(y - point.y, 2)
    }
    
    func distance(toPoint point: CGPoint) -> CGFloat {
        return sqrt(distanceSquared(toPoint: point))
    }
    
    func vectorToPoint(_ point: CGPoint) -> CGVector {
        return CGVector(dx: point.x - x, dy: point.y - y)
    }
    
    func vectorToSegment(_ segment: Segment) -> CGVector {
        let a = vectorToPoint(segment.start)
        let b = vectorToPoint(segment.end)
        let c = segment.vector
        
        if a.lengthSquared >= b.lengthSquared + segment.lengthSquared { return b }
        if b.lengthSquared >= a.lengthSquared + segment.lengthSquared { return a }
        
        return a - c * (a.dotProduct(c) / c.lengthSquared)
    }
    
    func vectorToRect(_ rect: CGRect) -> CGVector {
        if rect.contains(self) { return .zero }
        var vector = CGVector.zero
        if x > rect.maxX { vector.dx = rect.maxX - x }
        if x < rect.minX { vector.dx = rect.minX - x }
        if y > rect.maxY { vector.dy = rect.maxY - y }
        if y < rect.minY { vector.dy = rect.minY - y }
        return vector        
    }
}

extension CGRect {
    func offsetBy(_ vector: CGVector) -> CGRect {
        return self.offsetBy(dx: vector.dx, dy: vector.dy)
    }    
}

extension CGVector {
    var lengthSquared: CGFloat {
        return dx * dx + dy * dy
    }
    
    var length: CGFloat {
        return sqrt(lengthSquared)
    }
    
    func normalized() -> CGVector {
        return self / length
    }
    
    func dotProduct(_ vector: CGVector) -> CGFloat {
        return dx * vector.dx + dy * vector.dy
    }
    
    func projection(withDirection direction: CGVector) -> CGVector {
        return direction * dotProduct(direction) / direction.lengthSquared
    }
    
    func trimmedVector(startPoint p: CGPoint,
                       xRange: ClosedRange<CGFloat>,
                       yRange: ClosedRange<CGFloat>,
                       preserveDirection: Bool) -> CGVector {
        let resX = trimmedByX(startPoint: p, range: xRange, preserveDirection: preserveDirection)
        let resY = resX.trimmedByY(startPoint: p, range: yRange, preserveDirection: preserveDirection)
        return resY
    }
    
    private func trimmedByX(startPoint p: CGPoint, range: ClosedRange<CGFloat>, preserveDirection: Bool) -> CGVector {
        let dx: CGFloat = trim(self.dx + p.x, from: range.lowerBound, to: range.upperBound) - p.x
        let dy = preserveDirection && self.dx != 0 ? dx/self.dx * self.dy : self.dy
        return CGVector(dx: dx, dy: dy)
    }
    
    private func trimmedByY(startPoint p: CGPoint, range: ClosedRange<CGFloat>, preserveDirection: Bool) -> CGVector {
        let dy = trim(self.dy + p.y, from: range.lowerBound, to: range.upperBound) - p.y
        let dx = preserveDirection && self.dy != 0 ? dy/self.dy * self.dx : self.dx
        return CGVector(dx: dx, dy: dy)
    }

}

extension UIView {
    func convert(vector: CGVector, to view: UIView) -> CGVector {
        let start = convert(CGPoint.zero, to: view)
        let end = convert(CGPoint(x: vector.dx, y: vector.dy), to: view)
        return CGVector(dx: end.x - start.x, dy: end.y - start.y)
    }
    
    func convert(vector: CGVector, from view: UIView) -> CGVector {
        let start = convert(CGPoint.zero, from: view)
        let end = convert(CGPoint(x: vector.dx, y: vector.dy), from: view)
        return CGVector(dx: end.x - start.x, dy: end.y - start.y)
    }
}



