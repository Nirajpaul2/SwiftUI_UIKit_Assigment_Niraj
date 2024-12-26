//
//  NSObject+Extension.swift
//  IlaBankDemoUIKit_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import Foundation

extension NSObject {
    /**
     Variable to get class name
     - returns: Returns class name string
    */
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
