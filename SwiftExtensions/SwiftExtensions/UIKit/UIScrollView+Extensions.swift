//
//  UIScrollView+Extensions.swift
//  Croppy
//
//  Created by Alex Burtnik on 8/29/17.
//  Copyright © 2017 alexburtnik. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
    func scrollPointToCenter(_ point: CGPoint) {
        scrollPoint(point, toPosition: center)
    }
    
    func scrollPoint(_ contentPoint: CGPoint, toPosition position: CGPoint) {
        contentOffset = contentPoint - position/zoomScale
    }
    
    func shiftContentOffsetBy(_ vector: CGVector, animated: Bool = false) {
        setContentOffset(contentOffset + vector, animated: animated)
    }
    
    func zoomTo(point zoomPoint: CGPoint, scale: CGFloat, animated: Bool) {
        let scale = min(max(scale, minimumZoomScale), maximumZoomScale)
        
        let size = CGSize(width: frame.size.width / scale, height: frame.size.height / scale)
        let origin = CGPoint(x: zoomPoint.x - size.width/2, y: zoomPoint.y - size.height/2)
        let destinationRect = CGRect(origin: origin, size: size)
        
        if animated {
            UIView.animateEaseOut(0.55, animations: {
                self.zoom(to: destinationRect, animated: false)
            }, completion:  {
                if let view = self.delegate?.viewForZooming?(in: self) {
                    self.delegate?.scrollViewDidEndZooming?(self, with: view, atScale: scale)
                }
            })
        }
        else {
            self.zoom(to: destinationRect, animated: false)
        }
        
    }
}
