import Foundation
import UIKit

public extension CALayer {
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
    
    public var right: CGFloat {
        get { return self.x + self.width }
        set { self.x = newValue - self.width }
    }
    
    public var bottom: CGFloat {
        get { return self.y + self.height }
        set { self.y = newValue - self.height }
    }
    
    public var positionX: CGFloat {
        get { return self.position.x }
        set { self.x = newValue - self.width/2 }
    }
    
    public var positionY: CGFloat {
        get { return self.position.y }
        set { self.y = newValue - self.height/2 }
    }
    
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
            return frame.size
        }
        set {
            var bounds = self.bounds
            bounds.size = newValue
            self.bounds = bounds
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
    
    public var rotation: CGFloat {
        return atan2(transform.m12, transform.m11)
    }
}
