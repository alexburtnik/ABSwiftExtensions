//
//  RotatedRect.swift
//  Cropper
//
//  Created by Alex Burtnik on 4/13/17.
//  Copyright © 2017 alexburtnik. All rights reserved.
//

import Foundation
import UIKit

struct RotatedRect {
    var topLeft: CGPoint
    var topRight: CGPoint
    var bottomRight: CGPoint
    var bottomLeft: CGPoint
    
    var corners: [CGPoint] { return [topLeft, topRight, bottomRight, bottomLeft] }
    var center: CGPoint {
        return CGPoint(x: (topLeft.x + bottomRight.x)/2, y: (topLeft.y + bottomRight.y)/2)
    }
    
    func vectorToFitRect(_ rect: CGRect) -> CGVector? {
        var vector = CGVector.zero
        for corner in corners {
            let shift = (corner+vector).vectorToRect(rect)
            vector += shift
        }
//        guard translatedBy(vector: vector).isInside(rect) else { return nil }
        return vector
    }
    
    func translatedBy(vector: CGVector) -> RotatedRect {
        return RotatedRect(topLeft: topLeft + vector,
                           topRight: topRight + vector,
                           bottomRight: bottomRight + vector,
                           bottomLeft: bottomLeft + vector)
    }
    
    func isInside(_ rect: CGRect) -> Bool {
        return corners.filter{ !rect.contains($0) }.count == 0
    }
    
    var shortDescription: String {
        return "(\(topLeft.shortDescription)), (\(topRight.shortDescription)), (\(bottomRight.shortDescription)), (\(bottomLeft.shortDescription))"
    }
    
    var pathRepresentation: UIBezierPath {
        let rotatedRectPath = UIBezierPath()
        rotatedRectPath.move(to: topLeft)
        rotatedRectPath.addLine(to: topRight)
        rotatedRectPath.addLine(to: bottomRight)
        rotatedRectPath.addLine(to: bottomLeft)
        rotatedRectPath.addLine(to: topLeft)
        rotatedRectPath.close()
        return rotatedRectPath
    }
}

//extension CGRect 

extension UIView {
    
    func rotatedBounds(toView: UIView) -> RotatedRect {
        return rotatedRect(bounds, toView: toView)
    }
    
    func rotatedRect(_ rect: CGRect, toView: UIView) -> RotatedRect {
        return RotatedRect(topLeft: convert(rect.topLeft, to: toView),
                           topRight: convert(rect.topRight, to: toView),
                           bottomRight: convert(rect.bottomRight, to: toView),
                           bottomLeft: convert(rect.bottomLeft, to: toView))
    }

    //TODO: refactor
    func maskPath(rotatedRect: RotatedRect) -> UIBezierPath {
        let maskPath = UIBezierPath(rect: bounds)
        maskPath.append(rotatedRect.pathRepresentation)
        maskPath.usesEvenOddFillRule = true
        return maskPath
    }
    
}
