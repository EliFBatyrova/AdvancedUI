//
//  TasksViewController.swift
//  AdvancedUi
//
//  Created by Amir on 26.09.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController {
    
    //MARK: - UI elements
    @IBOutlet weak var titleContainerView: UIView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tasksCountLabel: UILabel!
    @IBOutlet weak var tasksTableView: UITableView!
    
    //MARK: - Available tasks array
    private var tasks: [TaskModel]!
    private var list: ListModel!
    
    //MARK: - VC lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
    }
    
    //MARK: - UI configuring
    private func initViews() {
        
        tableViewSettings()
        configureUI()
    }
    
    private func tableViewSettings() {
        
        tasksTableView.register(cell: TaskTableViewCell.self)
        tasksTableView.tableFooterView = UIView()
        tasksTableView.separatorStyle = .none
    }
    
    func configure(with list: ListModel) {
        
        self.tasks = list.tasks
        self.list = list
    }
    
    private func configureUI() {
        
        titleLabel.text = list.type.rawValue
        
        let tasksText = tasks.count == 1 ? "task" : "tasks"
        tasksCountLabel.text = "\(tasks.count) " + tasksText
        
        switch list.type {
        case .inbox:
            titleLabel.textColor = #colorLiteral(red: 0.1449999958, green: 0.1650000066, blue: 0.1920000017, alpha: 1)
            tasksTableView.backgroundColor = #colorLiteral(red: 0.9219999909, green: 0.9369999766, blue: 0.9610000253, alpha: 1)
            titleContainerView.backgroundColor = #colorLiteral(red: 0.9219999909, green: 0.9369999766, blue: 0.9610000253, alpha: 1)
            editButton.tintColor = #colorLiteral(red: 0.1449999958, green: 0.1650000066, blue: 0.1920000017, alpha: 1)
        case .work:
            tasksCountLabel.textColor = .white
            titleLabel.textColor = .white
            tasksTableView.backgroundColor = #colorLiteral(red: 0.3799999952, green: 0.8709999919, blue: 0.6430000067, alpha: 1)
            titleContainerView.backgroundColor = #colorLiteral(red: 0.3799999952, green: 0.8709999919, blue: 0.6430000067, alpha: 1)
            editButton.tintColor = .white
        case .personal:
            tasksCountLabel.textColor = .white
            titleLabel.textColor = .white
            tasksTableView.backgroundColor = #colorLiteral(red: 0.7139999866, green: 0.4709999859, blue: 1, alpha: 1)
            titleContainerView.backgroundColor = #colorLiteral(red: 0.7139999866, green: 0.4709999859, blue: 1, alpha: 1)
            editButton.tintColor = .white
        case .shopping:
            tasksCountLabel.textColor = .white
            titleLabel.textColor = .white
            tasksTableView.backgroundColor = #colorLiteral(red: 0.9570000172, green: 0.3689999878, blue: 0.4269999862, alpha: 1)
            titleContainerView.backgroundColor = #colorLiteral(red: 0.9570000172, green: 0.3689999878, blue: 0.4269999862, alpha: 1)
            editButton.tintColor = .white
        case .family:
            titleLabel.textColor = #colorLiteral(red: 0.1449999958, green: 0.1650000066, blue: 0.1920000017, alpha: 1)
            tasksTableView.backgroundColor = #colorLiteral(red: 1, green: 0.9060000181, blue: 0.3799999952, alpha: 1)
            titleContainerView.backgroundColor = #colorLiteral(red: 1, green: 0.9060000181, blue: 0.3799999952, alpha: 1)
            editButton.tintColor = #colorLiteral(red: 0.1449999958, green: 0.1650000066, blue: 0.1920000017, alpha: 1)
        case .none: return
        }
    }
    
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension TasksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.nibName, for: indexPath) as! TaskTableViewCell
        cell.configureWithoutIndicator(with: tasks[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }
}
