//
//  ListModel.swift
//  AdvancedUi
//
//  Created by Amir on 27.09.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import Foundation

struct ListModel {
    
    let type: TaskType
    let tasks: [TaskModel]
    
    static let mockups = [
        ListModel(type: .inbox, tasks: TaskModel.inboxMockups),
        ListModel(type: .work, tasks: TaskModel.workMockups),
        ListModel(type: .shopping, tasks: TaskModel.shoppingMockups),
        ListModel(type: .family, tasks: TaskModel.familyMockups),
        ListModel(type: .personal, tasks: TaskModel.personalMockups)
    ]
}
