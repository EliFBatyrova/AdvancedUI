//
//  CategoryViewController.swift
//  AdvancedUI
//
//  Created by Евгений on 27.09.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation
import UIKit

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var category: Category!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.showsVerticalScrollIndicator = false
        
        registerCells()
        
        switch category.category {
        case .inbox:
            tableView.backgroundColor = UIColor(hexString: "#EBEFF5")
        case .work:
            tableView.backgroundColor = UIColor(hexString: "#61DEA4")
        case .family:
            tableView.backgroundColor = UIColor(hexString: "#FFE761")
        case .shopping:
            tableView.backgroundColor = UIColor(hexString: "#F45E6D")
        case .personal:
            tableView.backgroundColor = UIColor(hexString: "#B678FF")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.tasks.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let rowIndex = indexPath.row
        
        switch rowIndex {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTitleTableViewCell.nibName, for: indexPath) as! CategoryTitleTableViewCell
            cell.configure(with: category)
            cell.paintCell(for: category.category)
            return cell
        default:
            let task = category.tasks[rowIndex - 1]
            
            
            if task.hasTimeCondition {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: TaskWithTimeTableViewCell.nibName, for: indexPath) as! TaskWithTimeTableViewCell
                cell.configure(with: task)
                cell.paintCell(for: category.category)
                return cell
            }
            else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.nibName, for: indexPath) as! TaskTableViewCell
                cell.configure(with: task)
                cell.paintCell(for: category.category)
                return cell
            }
        }
    }
    
    func registerCells() {
        
        tableView.register(cell: CategoryTitleTableViewCell.self)
        tableView.register(cell: TaskTableViewCell.self)
        tableView.register(cell: TaskWithTimeTableViewCell.self)
    }
}
