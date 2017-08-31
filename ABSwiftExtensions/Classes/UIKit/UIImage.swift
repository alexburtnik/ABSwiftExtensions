//
//  UIImage.swift
//  Pods
//
//  Created by Alex Burtnik on 8/31/17.
//
//

import Foundation

public extension UIImage {
    
    public static func image(withColor color: UIColor, size: CGSize? = nil, cornerRadius: CGFloat = 0) -> UIImage {
        let fillSize = size ?? CGSize(width: 1, height: 1)
        let roundedRect = UIBezierPath(roundedRect: CGRect(origin: .zero, size: fillSize), cornerRadius: cornerRadius)
        roundedRect.lineWidth = 0
        
        UIGraphicsBeginImageContextWithOptions(fillSize, false, 0)
        let graphicsContext = UIGraphicsGetCurrentContext()
        graphicsContext!.setFillColor(color.cgColor)
        roundedRect.fill()
        roundedRect.addClip()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let capInsets = UIEdgeInsets(top: cornerRadius, left: cornerRadius, bottom: cornerRadius, right: cornerRadius)
        return image!.resizableImage(withCapInsets: capInsets)
    }
    
}

