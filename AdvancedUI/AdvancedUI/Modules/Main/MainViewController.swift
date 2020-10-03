//
//  MainViewController.swift
//  AdvancedUI
//
//  Created by Enoxus on 20.09.2020.
//  Copyright © 2020 Enoxus. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var fabView: FabView!
    @IBOutlet weak var popupView: UIView!
    
    var tasks: [TaskViewModel] = [
        TaskViewModel(title: "Start making a presentation", listType: .work, isMarked: false, subLabelConfiguration: nil),
        TaskViewModel(title: "Pay for rent", listType: .personal, isMarked: true, subLabelConfiguration: TaskViewModel.SubLabelConfiguration(firstSubLabelImage: "clock", firstSubLabelText: "7:00 pm", secondSubLabelImage: nil, secondSubLabelText: nil)),
        TaskViewModel(title: "Buy a milk", listType: .shopping, isMarked: true, subLabelConfiguration: nil),
        TaskViewModel(title: "Don’t forget to pick up Mickael from school", listType: nil, isMarked: false, subLabelConfiguration: nil),
        TaskViewModel(title: "Buy a chocolate for Charlotte", listType: .shopping, isMarked: false, subLabelConfiguration: nil)
    ]
    
    var lists: [ListCellViewModel] = [
        ListCellViewModel(subtitle: "1 task", type: .inbox),
        ListCellViewModel(subtitle: "2 tasks", type: .work),
        ListCellViewModel(subtitle: "3 tasks", type: .shopping),
        ListCellViewModel(subtitle: "1 task", type: .family),
        ListCellViewModel(subtitle: "4 tasks", type: .personal)
    ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupTableView()
        setupFabAction()
        mainTableView.reloadData()
        popupView.alpha = 0
        setupFabShadow()
        setupPopupShadow()
    }
    
    private func registerCells() {
        
        mainTableView.register(cell: LargeTitleTableViewCell.self)
        mainTableView.register(cell: TaskTableViewCell.self)
        mainTableView.register(cell: TimedTaskTableViewCell.self)
        mainTableView.register(cell: ListsHeaderTableViewCell.self)
        mainTableView.register(cell: ListTableViewCell.self)
    }
    
    private func setupTableView() {
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.separatorStyle = .none
        registerCells()
    }
    
    private func setupFabShadow() {
        
        let shadowPath = UIBezierPath(roundedRect: fabView.bounds, cornerRadius: 0)
        fabView.layer.shadowPath = shadowPath.cgPath
        fabView.layer.shadowColor = UIColor(red: 0.084, green: 0.139, blue: 0.218, alpha: 0.16).cgColor
        fabView.layer.shadowOpacity = 1
        fabView.layer.shadowRadius = 32
        fabView.layer.shadowOffset = CGSize(width: 0, height: 24)
    }
    
    private func setupPopupShadow() {
        
        let shadowPath = UIBezierPath(roundedRect: popupView.bounds, cornerRadius: 0)
        popupView.layer.shadowPath = shadowPath.cgPath
        popupView.layer.shadowColor = UIColor(red: 0.075, green: 0.11, blue: 0.161, alpha: 0.2).cgColor
        popupView.layer.shadowOpacity = 1
        popupView.layer.shadowRadius = 30
        popupView.layer.shadowOffset = CGSize(width: 0, height: 10)
    }
    
    private func setupFabAction() {
        
        fabView.handler = { [weak self] active in
            
            guard let self = self else { return }
            
            if active {
                
                UIView.animate(withDuration: 0.4, delay: .zero, options: .curveEaseOut, animations: {
                    
                    self.popupView.alpha = 1
                    self.mainTableView.alpha = 0.3
                }, completion: { _ in
                    self.mainTableView.isUserInteractionEnabled = false
                })
            }
            else {
                
                UIView.animate(withDuration: 0.4, delay: .zero, options: .curveEaseOut, animations: {
                    
                    self.popupView.alpha = 0
                    self.mainTableView.alpha = 1
                }, completion: { _ in
                    self.mainTableView.isUserInteractionEnabled = true
                })
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "presentList", let viewModel = sender as? ListViewModel {
            
            let destination = segue.destination as! ListViewController
            destination.configure(with: viewModel)
        }
    }
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        let index = indexPath.row
        
        if index > tasks.count + 1 {
            
            let list = lists[index - tasks.count - 2]
            var tasks: [TaskViewModel] = []
            
            switch list.type {
                
            case .inbox:
                
                tasks.append(TaskViewModel(title: "Don’t forget to pick up Mickael from school", listType: list.type, isMarked: false, subLabelConfiguration: TaskViewModel.SubLabelConfiguration(firstSubLabelImage: "calendar", firstSubLabelText: "Today", secondSubLabelImage: nil, secondSubLabelText: nil)))
            case .work:
                
                tasks.append(TaskViewModel(title: "Start making a presentation", listType: list.type, isMarked: false, subLabelConfiguration: TaskViewModel.SubLabelConfiguration(firstSubLabelImage: "calendar_light", firstSubLabelText: "Today", secondSubLabelImage: nil, secondSubLabelText: nil), hasLightAppearance: true))
                tasks.append(TaskViewModel(title: "Call John", listType: list.type, isMarked: false, subLabelConfiguration: nil, hasLightAppearance: true))
            case .shopping:
                
                tasks.append(TaskViewModel(title: "Buy a milk", listType: list.type, isMarked: false, subLabelConfiguration: TaskViewModel.SubLabelConfiguration(firstSubLabelImage: "calendar_light", firstSubLabelText: "Today", secondSubLabelImage: nil, secondSubLabelText: nil), hasLightAppearance: true))
                tasks.append(TaskViewModel(title: "Buy a chocolate for Charlotte", listType: list.type, isMarked: false, subLabelConfiguration: TaskViewModel.SubLabelConfiguration(firstSubLabelImage: "calendar_light", firstSubLabelText: "Today", secondSubLabelImage: nil, secondSubLabelText: nil), hasLightAppearance: true))
                tasks.append(TaskViewModel(title: "Grapes", listType: list.type, isMarked: false, subLabelConfiguration: TaskViewModel.SubLabelConfiguration(firstSubLabelImage: "calendar_light", firstSubLabelText: "Tomorrow", secondSubLabelImage: nil, secondSubLabelText: nil), hasLightAppearance: true))
            case .family:
                
                tasks.append(TaskViewModel(title: "Greet niece", listType: list.type, isMarked: false, subLabelConfiguration: nil))
            case .personal:
                
                tasks.append(TaskViewModel(title: "Pay for rent", listType: list.type, isMarked: false, subLabelConfiguration: TaskViewModel.SubLabelConfiguration(firstSubLabelImage: "calendar_light", firstSubLabelText: "Today", secondSubLabelImage: "clock_light", secondSubLabelText: "7:00 pm"), hasLightAppearance: true))
                tasks.append(TaskViewModel(title: "Cut one’s hair", listType: list.type, isMarked: false, subLabelConfiguration: nil, hasLightAppearance: true))
                tasks.append(TaskViewModel(title: "Continue learning French", listType: list.type, isMarked: false, subLabelConfiguration: nil, hasLightAppearance: true))
                tasks.append(TaskViewModel(title: "Charge AirPods", listType: list.type, isMarked: false, subLabelConfiguration: nil, hasLightAppearance: true))
            }
            
            let viewModel = ListViewModel(header: list, tasks: tasks)
            performSegue(withIdentifier: "presentList", sender: viewModel)
        }
        else if let cell = tableView.cellForRow(at: indexPath) as? SelectableCell {
            cell.toggleMark()
        }
    }
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count + lists.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        
        switch index {
            
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: LargeTitleTableViewCell.nibName, for: indexPath)
        case 1 ..< tasks.count + 1:
            
            let viewModel = tasks[index - 1]
            if viewModel.isTimed {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: TimedTaskTableViewCell.nibName, for: indexPath) as! TimedTaskTableViewCell
                cell.configure(with: viewModel)
                return cell
            }
            else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.nibName, for: indexPath) as! TaskTableViewCell
                cell.configure(with: viewModel)
                return cell
            }
        case tasks.count + 1:
            
            return tableView.dequeueReusableCell(withIdentifier: ListsHeaderTableViewCell.nibName, for: indexPath)
        default:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.nibName, for: indexPath) as! ListTableViewCell
            cell.configure(with: lists[index - tasks.count - 2])
            return cell
        }
    }
}
