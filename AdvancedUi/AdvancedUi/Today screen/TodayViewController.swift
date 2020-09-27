//
//  ViewController.swift
//  AdvancedUi
//
//  Created by Amir on 20.09.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {

    //MARK: - UI elements
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var popupView: PopupView!
    @IBOutlet weak var plusButtonView: PlusButtonView!
    
    //MARK: - Mockups
    private let tasks = TaskModel.mockups
    private let lists = ListModel.mockups
    
    //MARK: - VC lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
        popupView.isHidden = true
    }
    
    //MARK: - UI configuring
    private func initViews() {
                
        addButtonSettings()
        tasksTableViewSettings()
    }
    
    private func tasksTableViewSettings() {
                
        [TaskTableViewCell.self, ListTableViewCell.self].forEach { self.tableView.register(cell: $0) }
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    
    private func addButtonSettings() {
        plusButtonView.delegate = self
    }
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "presentTasks", let list = sender as? ListModel {
            
            let destination = segue.destination as! TasksViewController
            
            destination.configure(with: list)
        }
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension TodayViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? tasks.count : lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.nibName, for: indexPath) as! TaskTableViewCell
            
            cell.configure(with: tasks[indexPath.row])
            
            return cell
        case 1:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.nibName, for: indexPath) as! ListTableViewCell
            
            cell.configure(with: lists[indexPath.row])
            
            return cell
        default: return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard section == 1 else { return nil }
        return ListsHeaderView.instanceFromNib()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        guard section == 1 else { return 0 }
        return ListsHeaderView.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.section {
        case 0:
            let cell = tableView.cellForRow(at: indexPath) as! TaskTableViewCell
            cell.isCheckboxChecked.toggle()
        case 1:
            print(lists[indexPath.row])
            performSegue(withIdentifier: "presentTasks", sender: lists[indexPath.row])
        default: return
        }
    }
}

//MARK: - PlusButtonViewDelegate
extension TodayViewController: PlusButtonViewDelegate {
    
    func didPressPlusButton(buttonState: Bool) {
        
        UIView.animate(withDuration: 0.4, animations: {
            
            self.popupView.isHidden = !buttonState
            self.tableView.alpha = buttonState ? 0.3 : 1
            
        }) { _ in
            self.tableView.isUserInteractionEnabled = !buttonState
        }        
    }
}
