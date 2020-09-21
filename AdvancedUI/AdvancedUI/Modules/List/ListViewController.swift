//
//  ListViewController.swift
//  AdvancedUI
//
//  Created by Enoxus on 21.09.2020.
//  Copyright © 2020 Enoxus. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    var viewModel: ListViewModel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupTableView()
    }

    func configure(with viewModel: ListViewModel) {
        self.viewModel = viewModel
    }
    
    private func setupTableView() {
        
        listTableView.dataSource = self
        listTableView.separatorStyle = .none
        listTableView.allowsSelection = false
        
        registerCells()
        
        switch viewModel.header.type {
            
        case .inbox:
            listTableView.backgroundColor = .listGrey
        case .work:
            listTableView.backgroundColor = .listGreen
        case .shopping:
            listTableView.backgroundColor = .listRed
        case .family:
            listTableView.backgroundColor = .listYellow
        case .personal:
            listTableView.backgroundColor = .listPurple
        }
    }
    
    private func registerCells() {
        
        listTableView.register(cell: SubtitledLargeTitleTableViewCell.self)
        listTableView.register(cell: TaskTableViewCell.self)
        listTableView.register(cell: TimedTaskTableViewCell.self)
    }
}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tasks.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        
        switch index {
            
        case 0:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: SubtitledLargeTitleTableViewCell.nibName, for: indexPath) as! SubtitledLargeTitleTableViewCell
            cell.configure(with: viewModel.header)
            cell.backgroundColor = .clear
            return cell
        default:
            
            let task = viewModel.tasks[index - 1]
            if task.isTimed {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: TimedTaskTableViewCell.nibName, for: indexPath) as! TimedTaskTableViewCell
                cell.configure(with: task)
                cell.backgroundColor = .clear
                return cell
            }
            else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.nibName, for: indexPath) as! TaskTableViewCell
                cell.configure(with: task)
                cell.backgroundColor = .clear
                return cell
            }
        }
    }
}
