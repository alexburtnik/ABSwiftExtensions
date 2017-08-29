//
//  UIView+Animate.swift
//  OpenCircles
//
//  Created by Alex Burtnik on 7/17/16.
//  Copyright © 2016 OpenCycles. All rights reserved.
//

import Foundation
import UIKit

func withoutCAAnimations(closure: () -> ()) {
    CATransaction.begin()
    CATransaction.setValue(kCFBooleanTrue, forKey: kCATransactionDisableActions)
    closure()
    CATransaction.commit()
}

extension UIView {
    
    //MARK: Fade in/out
    func blink(withDuration duration: TimeInterval, completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: duration/2,
                       animations: {
                        self.alpha = 0
        },
                       completion: { _ in
                        self.alpha = 1
        })
    }
    

    
    func show(shown: Bool, duration: Double, completion: (()->Void)? = nil) {
        UIView.animate(withDuration: duration,
                       animations: {
                        self.alpha = shown ? 1 : 0
        },
                       completion: { _ in completion?() })
    }
    
    func show(shown: Bool, animated: Bool = false, completion: (()->Void)? = nil) {
        show(shown: shown, duration: animated ? 0.3 : 0, completion: completion)
    }
    
    func update(withFadeDuration fadeDuration: TimeInterval, update: @escaping (()->Void), completion: (()->Void)? = nil) {
        UIView.animate(withDuration: fadeDuration,
                       animations: {
                        self.alpha = 0
        },
                       completion: { _ in
                        update()
                        UIView.animate(withDuration: fadeDuration,
                                       animations: { 
                                        self.alpha = 1
                        },
                                       completion: { _ in completion?() })
        })
    }
    
    //MARK: Animate with duration

    static func animate(withDuration duration: TimeInterval, delay: TimeInterval, animations: @escaping ()->Void) {
        UIView.animate(withDuration: duration, delay: delay, options: [.curveEaseInOut], animations: animations, completion: nil)
    }
    
    static func animate(withDuration duration: TimeInterval, delay: TimeInterval, options: UIViewAnimationOptions, animations: @escaping ()->Void) {
        UIView.animate(withDuration: duration, delay: delay, options: options, animations: animations, completion: nil)
    }
    
    static func animate(withDuration duration: TimeInterval, options: UIViewAnimationOptions, animations: @escaping ()->Void, completion: (()->Void)?) {
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: animations) { _ in completion?() }
    }
    
    static func animate(withDuration duration: TimeInterval, options: UIViewAnimationOptions, animations: @escaping ()->Void) {
        UIView.animate(withDuration: duration, options: options, animations: animations, completion: nil)
    }
    
    static func animateEaseOut(_ duration: TimeInterval, delay: TimeInterval = 0, animations: @escaping ()->Void, completion: (()->Void)? = nil) {
        UIView.animate(
            withDuration: duration,
            delay: delay,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 0.6,
            options: .allowUserInteraction,
            animations: animations,
            completion: { _ in completion?() })
    }
    

    
}

