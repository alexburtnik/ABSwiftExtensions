//
//  CGPoint+Geometry.swift
//  Pods
//
//  Created by Alex Burtnik on 8/31/17.
//
//

import Foundation

public extension CGPoint {
 
    public func rounded() -> CGPoint {
        return CGPoint(x: round(x), y: round(y))
    }
    
    public func distanceSquared(toPoint point: CGPoint) -> CGFloat {
        return pow(x - point.x, 2) + pow(y - point.y, 2)
    }
    
    public func distance(toPoint point: CGPoint) -> CGFloat {
        return sqrt(distanceSquared(toPoint: point))
    }
    
    public func vectorToPoint(_ point: CGPoint) -> CGVector {
        return CGVector(dx: point.x - x, dy: point.y - y)
    }
    
    public func vectorToSegment(_ segment: Segment) -> CGVector {
        let a = vectorToPoint(segment.start)
        let b = vectorToPoint(segment.end)
        let c = segment.vector
        
        if a.lengthSquared >= b.lengthSquared + segment.lengthSquared { return b }
        if b.lengthSquared >= a.lengthSquared + segment.lengthSquared { return a }
        
        return a - c * (a.dotProduct(c) / c.lengthSquared)
    }
    
    public func vectorToRect(_ rect: CGRect) -> CGVector {
        if rect.contains(self) { return .zero }
        var vector = CGVector.zero
        if x > rect.maxX { vector.dx = rect.maxX - x }
        if x < rect.minX { vector.dx = rect.minX - x }
        if y > rect.maxY { vector.dy = rect.maxY - y }
        if y < rect.minY { vector.dy = rect.minY - y }
        return vector
    }
}
