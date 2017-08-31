//
//  NSObject+Extensions.swift
//  s9fc
//
//  Created by Alex Burtnik on 5/31/17.
//  Copyright © 2017 smartum.pro. All rights reserved.
//

import Foundation

public extension NSObject {
    public class var nameOfClass: String{
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    public var nameOfClass: String{
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }
}
