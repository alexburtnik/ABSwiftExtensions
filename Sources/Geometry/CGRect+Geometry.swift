//
//  CGRect+Geometry.swift
//  Cropper
//
//  Created by Alex Burtnik on 4/6/17.
//  Copyright © 2017 alexburtnik. All rights reserved.
//

import Foundation
import UIKit

extension CGRect {
    
    init(x: CGFloat, y: CGFloat, size: CGSize) {
        self.init(x: x, y: y, width: size.width, height: size.height)
    }
    
    init(center: CGPoint, size: CGSize) {
        self.init(centerX: center.x, centerY: center.y, width: size.width, height: size.height)
    }
    
    init(centerX: CGFloat, centerY: CGFloat, width: CGFloat, height: CGFloat) {
        self.init(x: centerX - width/2, y: centerY - height/2, width: width, height: height)
    }
    
    init(centerX: CGFloat, centerY: CGFloat, size: CGSize) {
        self.init(centerX: centerX, centerY: centerY, width: size.width, height: size.height)
    }
    
    var center: CGPoint {
        return CGPoint(x: midX, y: midY)
    }
    
    var x: CGFloat {
        get { return origin.x }
        set { origin.x = newValue }
    }
    
    var y: CGFloat {
        get { return origin.y }
        set { origin.y = newValue }
    }
    
    var width: CGFloat {
        get { return size.width }
        set { size.width = newValue }
    }
    
    var height: CGFloat {
        get { return size.height }
        set { size.height = newValue }
    }
    
    var aspectRatio: CGFloat {
        return size.aspectRatio
    }
    
    //MARK Sides
    
    var left: CGFloat {
        get { return x }
        set {
            width += x - newValue
            x = newValue
        }
    }
    
    var top: CGFloat {
        get { return y }
        set {
            height += origin.y - newValue
            y = newValue
        }
    }
    
    var right: CGFloat {
        get { return x + width }
        set { width = newValue - x }
    }
    
    var bottom: CGFloat {
        get { return y + height }
        set { height = newValue - y }
    }
    
    //MARK Corners
    
    var topLeft: CGPoint {
        get { return origin }
        set { left = newValue.x; top = newValue.y }
    }
    
    var topRight: CGPoint {
        get { return CGPoint(x: right, y: top) }
        set { right = newValue.x; top = newValue.y }
    }
    
    var bottomRight: CGPoint {
        get { return CGPoint(x: right, y: bottom) }
        set { right = newValue.x; bottom = newValue.y }
    }
    
    var bottomLeft: CGPoint {
        get { return CGPoint(x: left, y: bottom) }
        set { left = newValue.x; bottom = newValue.y }
    }
    
    var corners: [CGPoint] {
        return [topLeft, topRight, bottomRight, bottomLeft]
    }
    
    func rounded() -> CGRect {
        return CGRect(origin: origin.rounded(), size: size.rounded())
    }
    
    func relativePoint(_ point: CGPoint) -> CGPoint {
        return CGPoint(x: point.x/width, y: point.y/height) + origin
    }
    
    func insetBy(_ insets: UIEdgeInsets) -> CGRect {
        return CGRect(
            x: x + insets.left,
            y: y + insets.top,
            width: width - insets.left - insets.right,
            height: height - insets.top - insets.bottom
        )
    }
}


extension CGSize {
    
    init (square: CGFloat) {
        self.init(width: square, height: square)
    }
    
    var aspectRatio: CGFloat {
        return width/height
    }
    
    var maxSide: CGFloat {
        return max(width, height)
    }
    var minSide: CGFloat {
        return min(width, height)
    }
    
    func rounded() -> CGSize {
        return CGSize(width: round(width), height: round(height))
    }
    
    func sizeThatFits(_ size: CGSize) -> CGSize {
        let scaleFactor = [size.width/self.width, size.height/self.height, 1].min()!
        return self * scaleFactor
    }
    
    func sizeByAdding(width: CGFloat, height: CGFloat) -> CGSize {
        return CGSize(width: self.width + width, height: self.height + height)
    }

}

extension CGPoint {
    func rounded() -> CGPoint {
        return CGPoint(x: round(x), y: round(y))
    }
}

extension CGVector {
    
    init(point: CGPoint) {
        self.init(dx: point.x, dy: point.y)
    }
    
}

