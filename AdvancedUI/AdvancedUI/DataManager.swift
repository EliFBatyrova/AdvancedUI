//
//  DataManager.swift
//  AdvancedUI
//
//  Created by Евгений on 27.09.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

class DataManager {
    
    func getTasks() -> [Task] {
        
        var tasks: [Task] = []
        
        tasks.append(Task(text: "Start making a presentation", category: .work, time: nil, date: nil, hasTimeCondition: false))
        tasks.append(Task(text: "Pay for rent", category: .personal, time: "7:00 pm", date: nil, hasTimeCondition: true))
        tasks.append(Task(text: "Buy a milk", category: .shopping, time: nil, date: nil, hasTimeCondition: false))
        tasks.append(Task(text: "Don’t forget to pick up Mickael from school", category: .inbox, time: nil, date: nil, hasTimeCondition: false))
        tasks.append(Task(text: "Buy a chocolate for Charlotte", category: .shopping, time: nil, date: nil, hasTimeCondition: false))
        
        return tasks
    }
    
    func getCategories() -> [Category] {
        
        var categories: [Category] = []
        
        categories.append(Category(name: "Inbox", category: .inbox, numberOfTasks: 1, tasks: [
            Task(text: "Don’t forget to pick up Mickael from school", category: .inbox, time: nil, date: nil, hasTimeCondition: false)]))
        
        categories.append(Category(name: "Work", category: .work, numberOfTasks: 2, tasks: [
            Task(text: "Start making a presentation", category: .work, time: nil, date: nil, hasTimeCondition: false),
            Task(text: "Call John", category: .work, time: nil, date: "Today", hasTimeCondition: true)]))
        
        categories.append(Category(name: "Shopping", category: .shopping, numberOfTasks: 3, tasks: [
            Task(text: "Buy a milk", category: .shopping, time: nil, date: "Today", hasTimeCondition: true),
            Task(text: "Buy a chocolate for Charlotte", category: .shopping, time: nil, date: "Today", hasTimeCondition: true),
            Task(text: "Grapes", category: .shopping, time: nil, date: "Tomorrow", hasTimeCondition: true)
        ]))
        
        categories.append(Category(name: "Family", category: .family, numberOfTasks: 1, tasks: [
            Task(text: "Greet niece", category: .family, time: nil, date: nil, hasTimeCondition: false),
        ]))
        
        categories.append(Category(name: "Personal", category: .personal, numberOfTasks: 4, tasks: [
            Task(text: "Pay for rent", category: .personal, time: "7:00 pm", date: "Today", hasTimeCondition: true),
            Task(text: "Cut one's hair", category: .personal, time: nil, date: nil, hasTimeCondition: false),
            Task(text: "Continue learning French", category: .personal, time: nil, date: nil, hasTimeCondition: false),
            Task(text: "Change AirPods", category: .personal, time: nil, date: nil, hasTimeCondition: false)
        ]))
        
        return categories
    }
}
