//
//  Double + Extensions.swift
//  Calc
//
//  Created by Vadim on 13.10.2022.
//

import UIKit

extension Double {
    
    var stringWithoutZeroFrection: String {
        truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
