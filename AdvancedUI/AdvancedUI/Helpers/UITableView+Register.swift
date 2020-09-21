//
//  UITableView+Register.swift
//  AdvancedUI
//
//  Created by Enoxus on 20.09.2020.
//  Copyright © 2020 Enoxus. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func register(cell: UITableViewCell.Type) {
        
        register(UINib(nibName: cell.nibName, bundle: nil), forCellReuseIdentifier: cell.nibName)
    }
}
