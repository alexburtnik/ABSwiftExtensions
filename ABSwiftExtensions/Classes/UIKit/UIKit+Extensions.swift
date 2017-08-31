//
//  UIKit+Extensions.swift
//  s9fc
//
//  Created by Alex Burtnik on 6/9/17.
//  Copyright © 2017 smartum.pro. All rights reserved.
//

import Foundation
import UIKit
//import Kingfisher
//import MBProgressHUD
//import OrderedSet

//extension UIViewController {
//    func setupLeftBackButton() {
//        let index = navigationController?.viewControllers.index(of: self)
//        if index != 0 {
//            navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icon_back"), target: self, action: #selector(backAction))
//        }
//    }
//    
//    @objc private func backAction() {
//        _ = navigationController?.popViewController(animated: true)
//    }
//    
//    func setupLeftCloseButton() {
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icon_cross"), target: self, action: #selector(closePressed))
//    }
//    
//    @objc private func closePressed() {
//        dismiss(animated: true, completion: nil)
//    }
//    
//    func showHUD(animated: Bool = true) {
//        let hud = MBProgressHUD.showAdded(to: view, animated: true)
//        hud.tintColor = Colors.green
//    }
//    
//    func hideHUD(animated: Bool = true) {
//        MBProgressHUD.hide(for: view, animated: true)
//    }
//    
//
//    func setupPullToRefresh(tableView: UITableView, action: @escaping ((()->Void)?)->Void) {
//        let refreshHeader = RefreshHeaderAnimator.init(frame: CGRect.zero)
//        tableView.es_addPullToRefresh(animator: refreshHeader) {
//            action() {
//                tableView.es_stopPullToRefresh()
//            }
//        }
//    }
//
//}

//extension UIImageView {
//    
//    func setImage(urlString: String?, placeholder: UIImage? = nil, animated: Bool = true) {
//        guard let urlString = urlString, let url = URL(string: urlString) else {
//            self.image = placeholder; return
//        }
//        var options: KingfisherOptionsInfo = []
//        if animated {
//            options.append(.transition(.fade(0.2)))
//        }
//        self.kf.setImage(with: url, placeholder: placeholder, options: options)
//    }
//}







//extension UIScrollView {
//    func scrollToBottom(animated: Bool) {
//        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
//        setContentOffset(bottomOffset, animated: animated)
//    }
//    
//    var bottomInset: CGFloat {
//        get { return contentInset.bottom }
//        set {
//            var contentInset = self.contentInset
//            contentInset.bottom = newValue
//            self.contentInset = contentInset
//        }
//    }
//}




