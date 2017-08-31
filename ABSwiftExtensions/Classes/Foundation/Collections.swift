//
//  Collections.swift
//  Pods
//
//  Created by Alex Burtnik on 8/31/17.
//
//

import Foundation

public extension Dictionary where Value: Equatable {
    func allKeys(forValue val: Value) -> [Key] {
        return self.filter { $1 == val }.map { $0.0 }
    }
}

public extension Array {
    func splitBy(_ chunkSize: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: chunkSize).map({ (startIndex) -> [Element] in
            let endIndex = (startIndex.advanced(by: chunkSize) > self.count) ? self.count-startIndex : chunkSize
            return Array(self[startIndex..<startIndex.advanced(by: endIndex)])
        })
    }
}

public func + <K, V> (left: [K:V], right: [K:V]) -> [K:V] {
    var result = left
    for (k, v) in right {
        result[k] = v
    }
    return result
}

public extension Array {
    public func insertionIndex(of element: Element, isOrderedBefore: (Element, Element) -> Bool) -> Int {
        var lo = 0
        var hi = self.count - 1
        while lo <= hi {
            let mid = (lo + hi)/2
            if isOrderedBefore(self[mid], element) {
                lo = mid + 1
            } else if isOrderedBefore(element, self[mid]) {
                hi = mid - 1
            } else {
                return mid // found at position mid
            }
        }
        return lo // not found, would be inserted at position lo
    }
}

//extension OrderedSet {
//    func insertionIndex(of element: Element, isOrderedBefore: (Element, Element) -> Bool) -> Int {
//        var lo = 0
//        var hi = self.count - 1
//        while lo <= hi {
//            let mid = (lo + hi)/2
//            if isOrderedBefore(self[mid], element) {
//                lo = mid + 1
//            } else if isOrderedBefore(element, self[mid]) {
//                hi = mid - 1
//            } else {
//                return mid // found at position mid
//            }
//        }
//        return lo // not found, would be inserted at position lo
//    }
//}
