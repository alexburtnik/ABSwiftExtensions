//
//  Photos+Extensions.swift
//  Croppy
//
//  Created by Alex Burtnik on 7/3/17.
//  Copyright © 2017 alexburtnik. All rights reserved.
//

import Foundation
import UIKit
import Photos

public extension PHAssetCollection {
    public var photosCount: Int {
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "mediaType == %d", PHAssetMediaType.image.rawValue)
        let result = PHAsset.fetchAssets(in: self, options: fetchOptions)
        return result.count
    }
    
    public func fetchLastPhoto(resizeTo size: CGSize?, imageCallback: @escaping (UIImage?) -> Void) {
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        fetchOptions.fetchLimit = 1
        
        let fetchResult = PHAsset.fetchAssets(in: self, options: fetchOptions)
        if let asset = fetchResult.firstObject {
            let manager = PHImageManager.default()
            let targetSize = size == nil ? CGSize(width: asset.pixelWidth, height: asset.pixelHeight) : size!
            manager.requestImage(for: asset,
                                 targetSize: targetSize,
                                 contentMode: .aspectFit,
                                 options: nil,
                                 resultHandler: { image, info in
                                    imageCallback(image)
            })
        } else {
            imageCallback(nil)
        }
    }
}

public extension PHAsset {
    public func image(size: CGSize) -> UIImage? {
        let manager = PHImageManager.default()
        let options = PHImageRequestOptions()
        options.isSynchronous = true
        var result: UIImage?
        manager.requestImage(for: self,
                             targetSize: size,
                             contentMode: .aspectFit,
                             options: options) { image, info in
                            result = image
        }
        return result
    }
    
    public func originalImage() -> UIImage? {
        var result: UIImage?
        let manager = PHImageManager.default()
        let options = PHImageRequestOptions()
        options.version = .original
        options.isSynchronous = true
        manager.requestImageData(for: self, options: options) { data, _, _, _ in
            if let data = data {
                result = UIImage(data: data)
            }
        }
        return result
    }
    
    
}



