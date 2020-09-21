//
//  ListCellViewModel.swift
//  AdvancedUI
//
//  Created by Enoxus on 20.09.2020.
//  Copyright © 2020 Enoxus. All rights reserved.
//

import Foundation

struct ListCellViewModel {
    
    let subtitle: String
    let type: ListType
    
    var title: String {
        type.rawValue
    }
}
