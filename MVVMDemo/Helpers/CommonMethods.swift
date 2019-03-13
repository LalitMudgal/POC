//
//  CommonMethods.swift
//  MVVMDemo
//
//  Created by Lalit on 02/03/19.
//  Copyright © 2018 Tutorial. All rights reserved.
//

import Foundation
import UIKit

class CommonMethods {
    class func showAlertOnWindow(title: String = Constant.kAppName, message: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alertController.showAletOnWindow()
    }
}
