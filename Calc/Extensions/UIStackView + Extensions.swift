//
//  UIStackView + Extensions.swift
//  Calc
//
//  Created by Vadim on 09.10.2022.
//

import UIKit

extension UIStackView {
    
    convenience init(subviews: [UIView]) {
        
        self.init(arrangedSubviews: subviews)
        self.axis = .horizontal
        self.spacing = 1
        self.distribution = .fillEqually
    }
}
