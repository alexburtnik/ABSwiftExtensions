import Foundation
import UIKit

public extension UIView{

    public var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    public var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    public var origin: CGPoint {
        get {
            return frame.origin
        }
        set {
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
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
            height += y - newValue
            y = newValue
        }
    }
    
    public var right: CGFloat {
        get { return x + width }
        set { x = newValue - width }
    }
    
    public var bottom: CGFloat {
        get { return y + height }
        set { y = newValue - height }
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
    
    public func setAnchorPoint(_ anchorPoint: CGPoint) {
        let newPoint = CGPoint(x: size.width * anchorPoint.x, y: size.height * anchorPoint.y).applying(transform)
        let oldPoint = CGPoint(x: size.width * layer.anchorPoint.x, y: size.height * layer.anchorPoint.y).applying(transform)
        
        layer.position += newPoint - oldPoint
        layer.anchorPoint = anchorPoint;
    }
    
    //MARK Center
    
    public var centerX: CGFloat {
        get { return self.center.x }
        set { self.x = newValue - self.width/2 }
    }
    
    public var centerY: CGFloat {
        get { return self.center.y }
        set { self.y = newValue - self.height/2 }
    }
    
    //MARK Size
    
    public var width: CGFloat {
        get { return bounds.size.width }
        set {
            var bounds = self.bounds
            bounds.size.width = newValue
            self.bounds = bounds
        }
    }
    
    public var height: CGFloat {
        get { return bounds.size.height }
        set {
            var bounds = self.bounds
            bounds.size.height = newValue
            self.bounds = bounds
        }
    }
    
    public var size: CGSize {
        get {
            return bounds.size
        }
        set {
            var bounds = self.bounds
            bounds.size = newValue
            self.bounds = bounds
        }
    }
    
    //MARK Other    
    public var diagonal: CGFloat {
        return CGFloat(sqrt(width * width + height * height))
    }
}

public extension UIView {
    public func convert(vector: CGVector, to view: UIView) -> CGVector {
        let start = convert(CGPoint.zero, to: view)
        let end = convert(CGPoint(x: vector.dx, y: vector.dy), to: view)
        return CGVector(dx: end.x - start.x, dy: end.y - start.y)
    }
    
    public func convert(vector: CGVector, from view: UIView) -> CGVector {
        let start = convert(CGPoint.zero, from: view)
        let end = convert(CGPoint(x: vector.dx, y: vector.dy), from: view)
        return CGVector(dx: end.x - start.x, dy: end.y - start.y)
    }
}

