//
//  Utilities.swift
//  WA6
//
//  Created by Kai on 10/25/23.
//

import Foundation
import UIKit
extension UIViewController {
    func showErrorAlert(message: String? = "Input Error", title: String? = "Error!") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}

