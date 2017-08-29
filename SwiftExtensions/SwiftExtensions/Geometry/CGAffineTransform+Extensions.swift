//
//  CGAffineTransform+Extensions.swift
//  Croppy
//
//  Created by Alex Burtnik on 8/29/17.
//  Copyright © 2017 alexburtnik. All rights reserved.
//

import Foundation
import UIKit

extension CGAffineTransform {
    
    static func rotationAround(point: CGPoint, angle: CGFloat) -> CGAffineTransform {
        var transform = CGAffineTransform(translationX: -point.x, y: -point.y)
        transform = transform.rotated(by: angle)
        transform = transform.translatedBy(x: point.x, y: point.y)
        return transform
    }
    
    func translatedBy(_ vector: CGVector) -> CGAffineTransform {
        return translatedBy(x: vector.dx, y: vector.dy)
    }
    
    var angle: CGFloat {
        return atan2(b, a)
    }
    
}
