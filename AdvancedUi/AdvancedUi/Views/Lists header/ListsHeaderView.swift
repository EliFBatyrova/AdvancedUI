//
//  ListsHeaderView.swift
//  AdvancedUi
//
//  Created by Amir on 27.09.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

class ListsHeaderView: UIView {

    public static var height: CGFloat = 67
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "ListsHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
