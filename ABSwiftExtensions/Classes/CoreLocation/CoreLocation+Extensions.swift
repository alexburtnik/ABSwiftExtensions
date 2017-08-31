//
//  CoreLocation+Extensions.swift
//  Pods
//
//  Created by Alex Burtnik on 8/31/17.
//
//

import Foundation
import CoreLocation

public extension CLLocationCoordinate2D {
    public var isEmpty: Bool {
        return latitude == 0 && longitude == 0
    }
}
