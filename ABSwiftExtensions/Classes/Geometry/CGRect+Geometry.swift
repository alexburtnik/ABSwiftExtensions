//
//  CGRect+Geometry.swift
//  Cropper
//
//  Created by Alex Burtnik on 4/6/17.
//  Copyright © 2017 alexburtnik. All rights reserved.
//

import Foundation
import UIKit

public extension CGRect {
    
    public init(x: CGFloat, y: CGFloat, size: CGSize) {
        self.init(x: x, y: y, width: size.width, height: size.height)
    }
    
    public init(center: CGPoint, size: CGSize) {
        self.init(centerX: center.x, centerY: center.y, width: size.width, height: size.height)
    }
    
    public init(centerX: CGFloat, centerY: CGFloat, width: CGFloat, height: CGFloat) {
        self.init(x: centerX - width/2, y: centerY - height/2, width: width, height: height)
    }
    
    public init(centerX: CGFloat, centerY: CGFloat, size: CGSize) {
        self.init(centerX: centerX, centerY: centerY, width: size.width, height: size.height)
    }
    
    public var center: CGPoint {
        return CGPoint(x: midX, y: midY)
    }
    
    public var x: CGFloat {
        get { return origin.x }
        set { origin.x = newValue }
    }
    
    public var y: CGFloat {
        get { return origin.y }
        set { origin.y = newValue }
    }
    
    public var width: CGFloat {
        get { return size.width }
        set { size.width = newValue }
    }
    
    public var height: CGFloat {
        get { return size.height }
        set { size.height = newValue }
    }
    
    public var aspectRatio: CGFloat {
        return size.aspectRatio
    }
    
    //MARK Sides
    
    public var left: CGFloat {
        get { return x }
        set {
            width += x - newValue
            x = newValue
        }
    }
    
    public var top: CGFloat {
        get { return y }
        set {
            height += origin.y - newValue
            y = newValue
        }
    }
    
    public var right: CGFloat {
        get { return x + width }
        set { width = newValue - x }
    }
    
    public var bottom: CGFloat {
        get { return y + height }
        set { height = newValue - y }
    }
    
    //MARK Corners
    
    public var topLeft: CGPoint {
        get { return origin }
        set { left = newValue.x; top = newValue.y }
    }
    
    public var topRight: CGPoint {
        get { return CGPoint(x: right, y: top) }
        set { right = newValue.x; top = newValue.y }
    }
    
    public var bottomRight: CGPoint {
        get { return CGPoint(x: right, y: bottom) }
        set { right = newValue.x; bottom = newValue.y }
    }
    
    public var bottomLeft: CGPoint {
        get { return CGPoint(x: left, y: bottom) }
        set { left = newValue.x; bottom = newValue.y }
    }
    
    public var corners: [CGPoint] {
        return [topLeft, topRight, bottomRight, bottomLeft]
    }    

}

public extension CGRect {
    public func rounded() -> CGRect {
        return CGRect(origin: origin.rounded(), size: size.rounded())
    }
    
    public func relativePoint(_ point: CGPoint) -> CGPoint {
        return CGPoint(x: point.x/width, y: point.y/height) + origin
    }
    
    public func insetBy(_ insets: UIEdgeInsets) -> CGRect {
        return CGRect(
            x: x + insets.left,
            y: y + insets.top,
            width: width - insets.left - insets.right,
            height: height - insets.top - insets.bottom
        )
    }
    
    public func offsetBy(_ vector: CGVector) -> CGRect {
        return self.offsetBy(dx: vector.dx, dy: vector.dy)
    }
}








