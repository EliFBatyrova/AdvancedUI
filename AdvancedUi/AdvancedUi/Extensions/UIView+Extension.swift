//
//  UIView+Extension.swift
//  AdvancedUi
//
//  Created by Amir on 27.09.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

extension UIView {
    
    func addShadow(color: UIColor, radius: CGFloat, height: CGFloat) {
        
        let shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 0)
        self.layer.shadowPath = shadowPath.cgPath
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = CGSize(width: 0, height: height)
        
    }
}
