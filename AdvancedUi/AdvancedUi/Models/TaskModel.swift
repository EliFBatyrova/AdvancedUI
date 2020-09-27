//
//  TaskModel.swift
//  AdvancedUi
//
//  Created by Amir on 26.09.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import Foundation

struct TaskModel {
    
    struct DateEndModel {
        
        let endDay: String?
        let endTime: String?
    }
    
    let name: String
    let type: TaskType
    let dateEnd: DateEndModel?
    let isFinished: Bool
    
    static let mockups = [
        TaskModel(name: "Start making a presentation",
                  type: .work, dateEnd: DateEndModel(endDay: "Today", endTime: nil), isFinished: false),
        TaskModel(name: "Pay for rent",
                  type: .personal, dateEnd: DateEndModel(endDay: "Today", endTime: "7:00 pm"),
                  isFinished: true),
        TaskModel(name: "Buy a milk",
                  type: .shopping, dateEnd: nil, isFinished: false),
        TaskModel(name: "Don’t forget to pick up Mickael from school",
                  type: .inbox, dateEnd: nil, isFinished: false),
        TaskModel(name: "Buy a chocolate for Charlotte",
                  type: .shopping, dateEnd: nil, isFinished: false)
    ]
    
    static let inboxMockups = [TaskModel(name: "Don’t forget to pick up Mickael from school",
                                         type: .inbox, dateEnd: DateEndModel(endDay: "Today", endTime: nil),
                                         isFinished: false)]
    
    static let workMockups = [
        TaskModel(name: "Start making a presentation",
                  type: .work, dateEnd: DateEndModel(endDay: "Today", endTime: nil),
                  isFinished: false),
        TaskModel(name: "Call John", type: .work, dateEnd: nil, isFinished: true)
    ]
    
    static let shoppingMockups = [
        TaskModel(name: "Buy a milk",
                  type: .shopping, dateEnd: DateEndModel(endDay: "Today", endTime: nil),
                  isFinished: false),
        TaskModel(name: "Buy a chocolate for Charlotte",
                  type: .shopping, dateEnd: DateEndModel(endDay: "Today", endTime: nil),
                  isFinished: false),
        TaskModel(name: "Grapes",
                  type: .shopping, dateEnd: DateEndModel(endDay: "Today", endTime: nil),
                  isFinished: false)
    ]
    
    static let familyMockups = [TaskModel(name: "Greet niece", type: .family, dateEnd: nil, isFinished: false)]
    
    static let personalMockups = [
        TaskModel(name: "Pay for rent",
                  type: .personal, dateEnd: DateEndModel(endDay: "Today", endTime: "7:00 pm"),
                  isFinished: false),
        TaskModel(name: "Cut one’s hair", type: .personal, dateEnd: nil, isFinished: false),
        TaskModel(name: "Continue learning French",
                  type: .personal, dateEnd: nil, isFinished: false),
        TaskModel(name: "Charge AirPods", type: .personal, dateEnd: nil, isFinished: false)        
    ]
}

enum TaskType: String {
   
    case inbox = "Inbox"
    case work = "Work"
    case personal = "Personal"
    case shopping = "Shopping"
    case family = "Family"
    case none
}
