//
//  UIImage+Blur.swift
//  Croppy
//
//  Created by Alex Burtnik on 8/29/17.
//  Copyright © 2017 alexburtnik. All rights reserved.
//

import Foundation
import UIKit

public extension UIImage {
    
    public func blurredImage(radius: CGFloat, margin: CGFloat) -> UIImage? {
        let newSize = size.sizeByAdding(width: 2*margin, height: 2*margin)
        UIGraphicsBeginImageContextWithOptions(newSize, false, scale)
        guard let context = UIGraphicsGetCurrentContext(), let cgImage = self.cgImage else { return nil }
        let imageRect = CGRect(x: margin, y: margin, size: size)
        let flipVertical = CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: newSize.height)
        context.concatenate(flipVertical)
        context.draw(cgImage, in: imageRect)
        let insetImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return insetImage?.blurredImage(radius: radius)
    }
    
    public func blurredImage(radius: CGFloat) -> UIImage? {
        let context = CIContext(options: nil)
        guard let cgInput = self.cgImage else { return nil }
        let ciInput = CIImage(cgImage: cgInput)
        
        let filter = CIFilter(name: "CIGaussianBlur")
        filter?.setValue(ciInput, forKey: kCIInputImageKey)
        filter?.setValue(Float(radius), forKey: "inputRadius")
        
        guard let ciOutput = filter?.value(forKey: kCIOutputImageKey) as? CIImage,
            let cgOutput = context.createCGImage(ciOutput, from: ciInput.extent) else { return nil }
        
        return UIImage(cgImage: cgOutput)
    }
    
    
}
