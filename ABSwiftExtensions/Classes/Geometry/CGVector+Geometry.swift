//
//  CGVector+Geometry.swift
//  Pods
//
//  Created by Alex Burtnik on 8/31/17.
//
//

import Foundation

public extension CGVector {
    
    public init(point: CGPoint) {
        self.init(dx: point.x, dy: point.y)
    }
    
    public var lengthSquared: CGFloat {
        return dx * dx + dy * dy
    }
    
    public var length: CGFloat {
        return sqrt(lengthSquared)
    }
    
    public func normalized() -> CGVector {
        return self / length
    }
    
    public func dotProduct(_ vector: CGVector) -> CGFloat {
        return dx * vector.dx + dy * vector.dy
    }
    
    public func projection(withDirection direction: CGVector) -> CGVector {
        return direction * dotProduct(direction) / direction.lengthSquared
    }
    
    public func trimmedVector(startPoint p: CGPoint,
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

