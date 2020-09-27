//
//  UITable+Extensions.swift
//  AdvancedUi
//
//  Created by Amir on 26.09.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register(cell: UITableViewCell.Type) {
        register(UINib(nibName: cell.nibName, bundle: nil), forCellReuseIdentifier: cell.nibName)
    }
}

extension UITableViewCell {
    
    static var nibName: String {
        return String(describing: self)
    }
}
