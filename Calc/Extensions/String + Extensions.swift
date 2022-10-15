//
//  String + Extensions.swift
//  Calc
//
//  Created by Vadim on 13.10.2022.
//

import Foundation

extension String {
    
    var stringWithPoint: String {
        self.contains(".") ? self.replacingOccurrences(of: ".", with: ",") : self
    }
}
