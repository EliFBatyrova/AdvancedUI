//
//  UITableViewCell+NibName.swift
//  AdvancedUI
//
//  Created by Enoxus on 20.09.2020.
//  Copyright © 2020 Enoxus. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    static var nibName: String {
        
        return String(describing: self)
    }
}
