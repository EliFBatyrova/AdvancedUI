//
//  MainTableViewController.swift
//  AdvancedUI
//
//  Created by Евгений on 26.09.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit

class MainTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    @IBOutlet weak var ActiveFABView: UIView!
    @IBOutlet weak var FABView: UIView!
    @IBOutlet weak var FABButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [Task] = []
    var categories: [Category] = []
    var isFABActive = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.showsVerticalScrollIndicator = false

        let dataManager = DataManager()
        self.tasks = dataManager.getTasks()
        self.categories = dataManager.getCategories()
        
        registerCells()

        self.ActiveFABView.isHidden = true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 + tasks.count + categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let rowIndex = indexPath.row
        
        switch rowIndex {
            
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: LargeTitleTableViewCell.nibName, for: indexPath)
            
        case 1 ..< tasks.count + 1:
            
            let task = tasks[rowIndex - 1]
            
            
            if task.hasTimeCondition {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: TaskWithTimeTableViewCell.nibName, for: indexPath) as! TaskWithTimeTableViewCell
                cell.configure(with: task)
                return cell
            }
            else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.nibName, for: indexPath) as! TaskTableViewCell
                cell.configure(with: task)
                return cell
            }
            
        case tasks.count + 1:
            
            return tableView.dequeueReusableCell(withIdentifier: ListsTitleTableViewCell.nibName, for: indexPath)
            
        default:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ListCategoryTableViewCell.nibName, for: indexPath) as! ListCategoryTableViewCell
            cell.configure(with: categories[rowIndex - tasks.count - 2])
            return cell
        }
    }

    func registerCells() {
        
        tableView.register(cell: LargeTitleTableViewCell.self)
        tableView.register(cell: TaskTableViewCell.self)
        tableView.register(cell: ListsTitleTableViewCell.self)
        tableView.register(cell: ListCategoryTableViewCell.self)
        tableView.register(cell: TaskWithTimeTableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let rowIndex = indexPath.row
        
        switch rowIndex {
            
        case 1 ..< tasks.count + 1:
            let cell = tableView.cellForRow(at: indexPath) as! ClickableCell
            cell.selectCell()

        default:
            performSegue(withIdentifier: "toCategorySegue", sender: categories[rowIndex - tasks.count - 2])
        }
    }
    
    @IBAction func didPressFAB(_ sender: Any) {
        if isFABActive {
            UIView.animate(withDuration: 0.4, delay: .zero, options: .curveEaseOut, animations: {
                
                self.FABButton.transform = .identity
                self.FABView.backgroundColor = UIColor.white
                self.FABButton.imageView?.image = UIImage(named: "plus")
            }, completion: nil)
            self.ActiveFABView.isHidden = true
            isFABActive = false
            
        } else {
            UIView.animate(withDuration: 0.4, delay: .zero, options: .curveEaseOut, animations: {
                
                self.FABButton.transform = CGAffineTransform(rotationAngle: .pi / 4)
                self.FABView.backgroundColor = UIColor.blue
                self.FABButton.imageView?.image = UIImage(named: "xPlus")
            }, completion: nil)
            self.ActiveFABView.isHidden = false
            isFABActive = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCategorySegue" {
            if let destinationVC = segue.destination as? CategoryViewController {
                destinationVC.category = sender as? Category
            }
        }
    }
}
