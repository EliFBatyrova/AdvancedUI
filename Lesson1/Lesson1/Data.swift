//
//  Data.swift
//  Lesson1
//
//  Created by Emil Mubarakov on 26.09.2020.
//  Copyright © 2020 Emil Mubarakov. All rights reserved.
//

import UIKit

class DataToDo {
    
    static let shared = DataToDo()
    
    var tasks = [ToDoTask(title: "Start making a presentation", isMarked: true, opacity: 0.5,      markColor: UIColor.rgb(red: 244, green: 94, blue: 109)),
                ToDoTask(title: "Pay for rent", isMarked: false, opacity: 1, markColor: UIColor.rgb(red: 182, green: 120, blue: 255)),
                ToDoTask(title: "Buy a milk", isMarked: false, opacity: 1, markColor: UIColor.rgb(red: 97, green: 222, blue: 164)),
                ToDoTask(title: "Don’t forget to pick up Mickael from school", isMarked: false, opacity: 1, markColor: UIColor.rgb(red: 97, green: 222, blue: 164)),
                ToDoTask(title: "Buy a chocolate for Charlotte", isMarked: true, opacity: 0.5, markColor: UIColor.rgb(red: 244, green: 94, blue: 109))]
    
    var lists = [ListStruct(backgroundColor: UIColor.rgb(red: 235, green: 239, blue: 245), listName: "Inbox", countTasks: "0 task", lettersColor: UIColor.rgb(red: 37, green: 42, blue: 49)),
                 ListStruct(backgroundColor: UIColor.rgb(red: 97, green: 222, blue: 164), listName: "Work", countTasks: "2 tasks", lettersColor: UIColor.rgb(red: 255, green: 255, blue: 255)),
                 ListStruct(backgroundColor: UIColor.rgb(red: 244, green: 94, blue: 109), listName: "Shopping", countTasks: "2 tasks", lettersColor: UIColor.rgb(red: 255, green: 255, blue: 255)),
                 ListStruct(backgroundColor: UIColor.rgb(red: 255, green: 231, blue: 97), listName: "Family", countTasks: "1 task", lettersColor: UIColor.rgb(red: 37, green: 42, blue: 49)),
                 ListStruct(backgroundColor: UIColor.rgb(red: 182, green: 120, blue: 255), listName: "Personal", countTasks: "1 task", lettersColor: UIColor.rgb(red: 255, green: 255, blue: 255))]
}

struct ToDoTask {
    var title: String
    var isMarked: Bool
    var opacity: Float
    var markColor: UIColor
}


struct ListStruct {
    var backgroundColor: UIColor
    var listName: String
    var countTasks: String
    var lettersColor: UIColor
}
