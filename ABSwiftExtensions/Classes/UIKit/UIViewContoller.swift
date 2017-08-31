//
//  UIViewContoller+Extensions.swift
//  Pods
//
//  Created by Alex Burtnik on 8/31/17.
//
//

import Foundation
import UIKit

public extension UIViewController {
    public var isVisible: Bool {
        return isViewLoaded && view.window != nil
    }
    
    public func showError(message: String?) {
        let message = message ?? NSLocalizedString("Unknown error", comment: "Error handling")
        let title = NSLocalizedString("Error", comment: "Error handling")
        showMessage(title: title, message: message)
    }
    
    public func showMessage(title: String?, message: String?) {
        guard isVisible else { return }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = NSLocalizedString("Ok", comment: "Alert button")
        alert.addAction(UIAlertAction(title: ok, style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    public func showDialog(title: String?,
                    message: String?,
                    actionTitle: String? = NSLocalizedString("Ok", comment: "Alert button"),
                    cancelTitle: String? = NSLocalizedString("Cancel", comment: "Alert button"),
                    action: @escaping ()->Void) {
        guard isVisible else { return }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: { _ in action() }))
        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
