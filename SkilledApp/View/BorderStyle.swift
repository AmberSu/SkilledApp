//
//  BorderStyle.swift
//  SkilledApp
//
//  Created by MacOS on 15/01/2018.
//  Copyright © 2018 amberApps. All rights reserved.
//

import UIKit

class BorderStyle {
    private let border = CALayer()
    private let width = CGFloat(1.0)
    private let color = UIColor(displayP3Red: 176/255, green: 191/255, blue: 203/255, alpha: 0.8).cgColor
    
    func changeBorderStyle(textField: UITextField) {
        border.borderColor = color
        border.borderWidth = width
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width: textField.frame.size.width, height: textField.frame.size.height)
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }
}
