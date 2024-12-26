//
//  UIView+Extension.swift
//  IlaBankDemoUIKit_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import UIKit

extension UIView {
    
    func setRoundedCorner(radius: CGFloat? = 6.0) {
        self.layer.cornerRadius = radius ?? 6.0
        self.clipsToBounds = true
    }
    
    func setBorder(borderWidth: CGFloat? = 1.0, color: UIColor? = UIColor.black) {
        //Border
        self.layer.borderWidth = borderWidth ?? 1.0
        self.layer.borderColor = color?.cgColor
    }
    
    func setFixInView(_ container: UIView!) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.frame = container.frame
        container.addSubview(self)
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal,
                           toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal,
                           toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal,
                           toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal,
                           toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}
