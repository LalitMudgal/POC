//
//  Extension.swift
//  MVVMDemo
//
//  Created by Lalit on 02/03/19.
//  Copyright © 2018 Tutorial. All rights reserved.
//

import Foundation
import UIKit

public extension UIAlertController {
    func showAletOnWindow() {
        let win = UIWindow(frame: UIScreen.main.bounds)
        let vc = UIViewController()
        vc.view.backgroundColor = .clear
        win.rootViewController = vc
        win.windowLevel = UIWindowLevelAlert + 1
        win.makeKeyAndVisible()
        vc.present(self, animated: true, completion: nil)
    }
}

import SDWebImage

extension UIImageView {
    func setImageWithUrl(urlstring: String, placeholderImage: UIImage? = nil) {
        guard let url = URL(string: urlstring) else {
            self.image = placeholderImage
            return
        }
        self.sd_setImage(with: url, placeholderImage: placeholderImage, options: .highPriority)
}

}
