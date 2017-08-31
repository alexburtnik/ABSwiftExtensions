//
//  Geometry.swift
//  Cropper
//
//  Created by Alex Burtnik on 4/12/17.
//  Copyright © 2017 alexburtnik. All rights reserved.
//

import Foundation
import UIKit

public struct Circle {
    public var center: CGPoint
    public var radius: CGFloat
    
    public func vectorToRect(_ rect: CGRect) -> CGVector? {
        guard round(rect.width - 2 * radius) >= 0 && round(rect.height - 2 * radius) >= 0 else { return nil }
        return center.vectorToRect(rect.insetBy(dx: radius, dy: radius))        
    }
    
    public init(center: CGPoint, radius: CGFloat) {
        self.center = center
        self.radius = radius
    }
}

public struct Segment {
    public var start: CGPoint
    public var end: CGPoint
    
    public init(start: CGPoint, end: CGPoint) {
        self.start = start
        self.end = end
    }
    
    public init(startX: CGFloat, startY: CGFloat, endX: CGFloat, endY: CGFloat) {
        self.init(start: CGPoint(x: startX, y: startY), end: CGPoint(x: endX, y: endY))
    }
    
    public var lengthSquared: CGFloat {
        return start.distanceSquared(toPoint: end)
    }
    
    public var length: CGFloat {
        return start.distance(toPoint: end)
    }
    
    public var vector: CGVector {
        return start.vectorToPoint(end)
    }
}
