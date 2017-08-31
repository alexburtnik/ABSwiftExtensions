//
//  CGSize+Geometry.swift
//  Pods
//
//  Created by Alex Burtnik on 8/31/17.
//
//

import Foundation

public extension CGSize {
    
    public init (square: CGFloat) {
        self.init(width: square, height: square)
    }
    
    public var aspectRatio: CGFloat {
        return width/height
    }
    
    public var maxSide: CGFloat {
        return max(width, height)
    }
    public var minSide: CGFloat {
        return min(width, height)
    }
    
    public func rounded() -> CGSize {
        return CGSize(width: round(width), height: round(height))
    }
    
    public func sizeThatFits(size: CGSize) -> CGSize {
        let scaleFactor = [size.width/self.width, size.height/self.height, 1].min()!
        return self * scaleFactor
    }
    
    public func sizeByAdding(width: CGFloat, height: CGFloat) -> CGSize {
        return CGSize(width: self.width + width, height: self.height + height)
    }
    
}
