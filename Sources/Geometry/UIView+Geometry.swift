import Foundation
import UIKit

extension UIView{

    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    var origin: CGPoint {
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
            height += y - newValue
            y = newValue
        }
    }
    
    var right: CGFloat {
        get { return x + width }
        set { x = newValue - width }
    }
    
    var bottom: CGFloat {
        get { return y + height }
        set { y = newValue - height }
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
    
    func setAnchorPoint(_ anchorPoint: CGPoint) {
        let newPoint = CGPoint(x: size.width * anchorPoint.x, y: size.height * anchorPoint.y).applying(transform)
        let oldPoint = CGPoint(x: size.width * layer.anchorPoint.x, y: size.height * layer.anchorPoint.y).applying(transform)
        
        layer.position += newPoint - oldPoint
        layer.anchorPoint = anchorPoint;
    }
    
    //MARK Center
    
    var centerX: CGFloat {
        get { return self.center.x }
        set { self.x = newValue - self.width/2 }
    }
    
    var centerY: CGFloat {
        get { return self.center.y }
        set { self.y = newValue - self.height/2 }
    }
    
    //MARK Size
    
    var width: CGFloat {
        get { return bounds.size.width }
        set {
            var bounds = self.bounds
            bounds.size.width = newValue
            self.bounds = bounds
        }
    }
    
    var height: CGFloat {
        get { return bounds.size.height }
        set {
            var bounds = self.bounds
            bounds.size.height = newValue
            self.bounds = bounds
        }
    }
    
    var size: CGSize {
        get {
            return bounds.size
        }
        set {
            var bounds = self.bounds
            bounds.size = newValue
            self.bounds = bounds
        }
    }
    
//    var aspectRatio: CGFloat {
//        return size.aspectRatio
//    }
    
    //MARK Other
    
    var diagonal: CGFloat {
        return CGFloat(sqrt(width * width + height * height))
    }
}



extension UIScrollView {
    var contentOffsetX: CGFloat {
        get { return self.contentOffset.x }
        set { self.contentOffset = CGPoint(x: newValue, y: self.contentOffset.y) }
    }
        
    var contentOffsetY: CGFloat {
        get { return self.contentOffset.y }
        set { self.contentOffset = CGPoint(x: self.contentOffset.x, y: newValue)}
    }
}
