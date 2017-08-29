//
//  UIImage+Resize.swift
//
//  Created by Trevor Harmon on 08/05/09.
//  Swift 3 port by Giacomo Boccardo on 09/15/2016.
//
//  Free for personal or commercial use, with or without modification
//  No warranty is expressed or implied.
//
import UIKit

public extension UIImage {
    
    func resizedImage(maxSize: CGSize, interpolationQuality quality: CGInterpolationQuality) -> UIImage {
        return resizedImage(size.sizeThatFits(maxSize), interpolationQuality: quality)
    }

    // Returns a rescaled copy of the image, taking into account its orientation
    // The image will be scaled disproportionately if necessary to fit the bounds specified by the parameter
    public func resizedImage(_ newSize: CGSize, interpolationQuality quality: CGInterpolationQuality) -> UIImage {
        var drawTransposed: Bool
        
        switch(self.imageOrientation) {
        case .left, .leftMirrored, .right, .rightMirrored:
            drawTransposed = true
        default:
            drawTransposed = false
        }
        
        return self.resizedImage(
            newSize,
            transform: self.transformForOrientation(newSize),
            drawTransposed: drawTransposed,
            interpolationQuality: quality
        )
    }
    
    fileprivate func normalizeBitmapInfo(_ bI: CGBitmapInfo) -> UInt32 {
        var alphaInfo: UInt32 = bI.rawValue & CGBitmapInfo.alphaInfoMask.rawValue
        
        if alphaInfo == CGImageAlphaInfo.last.rawValue {
            alphaInfo =  CGImageAlphaInfo.premultipliedLast.rawValue
        }
        
        if alphaInfo == CGImageAlphaInfo.first.rawValue {
            alphaInfo = CGImageAlphaInfo.premultipliedFirst.rawValue
        }
        
        var newBI: UInt32 = bI.rawValue & ~CGBitmapInfo.alphaInfoMask.rawValue;
        
        newBI |= alphaInfo;
        
        return newBI
    }
    
    func croppedImage(rect: CGRect) -> UIImage? {
        guard let cgImage = cgImage?.cropping(to: rect) else { return nil }
        return UIImage(cgImage: cgImage, scale: 0.0, orientation: self.imageOrientation)
    }
    
    func borderedImage(width: CGFloat, borderColor: UIColor) -> UIImage? {
        let strokeRect = CGRect(origin: .zero, size: size).insetBy(dx: width/2, dy: width/2)
        let path = UIBezierPath(rect: strokeRect).cgPath
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        context.draw(self.cgImage!, in: CGRect(origin: .zero, size: size))
        context.setStrokeColor(borderColor.cgColor)
        context.addPath(path)        
        let image = UIImage(cgImage: context.makeImage()!)
        UIGraphicsEndImageContext()
        return image
    }
    
    func insetImage(_ inset: UIEdgeInsets, color: UIColor? = nil) -> UIImage? {
    
        let contextSize = CGSize(width: size.width - inset.left - inset.right, height: size.height - inset.top - inset.bottom)
        let imageRect = CGRect(x: -inset.left, y: -inset.top, size: size).integral
    
        UIGraphicsBeginImageContextWithOptions(contextSize, false, 0)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
            
        let fillColor = (color ?? .clear).cgColor
        context.setFillColor(fillColor)
        context.fill(CGRect(origin: .zero, size: contextSize))
        
        context.interpolationQuality = .high
        let flipVertical = CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: contextSize.height)
        context.concatenate(flipVertical)
        context.draw(self.cgImage!, in: imageRect)
        let newImage = UIImage(cgImage: context.makeImage()!)
        UIGraphicsEndImageContext()
        return newImage
        
    }
    
    func insetImage(dx: CGFloat, dy: CGFloat, color: UIColor? = nil) -> UIImage? {
        let edgeInsets = UIEdgeInsetsMake(dy, dx, dy, dx)
        return insetImage(edgeInsets, color: color)
    }

    fileprivate func resizedImage(_ newSize: CGSize, transform: CGAffineTransform, drawTransposed transpose: Bool, interpolationQuality quality: CGInterpolationQuality) -> UIImage {
        let newRect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height).integral
        let transposedRect = CGRect(x: 0, y: 0, width: newRect.size.height, height: newRect.size.width)
        let imageRef: CGImage = self.cgImage!
        
        // Build a context that's the same dimensions as the new size
        let bitmap: CGContext = CGContext(
            data: nil,
            width: Int(newRect.size.width),
            height: Int(newRect.size.height),
            bitsPerComponent: imageRef.bitsPerComponent,
            bytesPerRow: 0,
            space: imageRef.colorSpace!,
            bitmapInfo: normalizeBitmapInfo(imageRef.bitmapInfo)
            )!
        
        // Rotate and/or flip the image if required by its orientation
        bitmap.concatenate(transform)
        
        // Set the quality level to use when rescaling
        bitmap.interpolationQuality = quality
        
        // Draw into the context; this scales the image
        bitmap.draw(imageRef, in: transpose ? transposedRect: newRect)
        
        // Get the resized image from the context and a UIImage

        let newImageRef: CGImage = bitmap.makeImage()!
        return UIImage(cgImage: newImageRef)
    }
    
    fileprivate func transformForOrientation(_ newSize: CGSize) -> CGAffineTransform {
        var transform: CGAffineTransform = CGAffineTransform.identity
        
        switch (self.imageOrientation) {
        case .down, .downMirrored:
            // EXIF = 3 / 4
            transform = transform.translatedBy(x: newSize.width, y: newSize.height)
            transform = transform.rotated(by: CGFloat.pi)
        case .left, .leftMirrored:
            // EXIF = 6 / 5
            transform = transform.translatedBy(x: newSize.width, y: 0)
            transform = transform.rotated(by: CGFloat.pi/2)
        case .right, .rightMirrored:
            // EXIF = 8 / 7
            transform = transform.translatedBy(x: 0, y: newSize.height)
            transform = transform.rotated(by: -CGFloat.pi/2)
        default:
            break
        }
        
        switch(self.imageOrientation) {
        case .upMirrored, .downMirrored:
            // EXIF = 2 / 4
            transform = transform.translatedBy(x: newSize.width, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        case .leftMirrored, .rightMirrored:
            // EXIF = 5 / 7
            transform = transform.translatedBy(x: newSize.height, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        default:
            break
        }
        
        return transform
    }
}
