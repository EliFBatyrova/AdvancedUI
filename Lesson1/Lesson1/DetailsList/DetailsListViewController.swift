//
//  DetailsListViewController.swift
//  Lesson1
//
//  Created by Emil Mubarakov on 26.09.2020.
//  Copyright © 2020 Emil Mubarakov. All rights reserved.
//

import UIKit

class DetailsListViewController: UIViewController {

    @IBOutlet weak var detailListTableView: UITableView!
    @IBOutlet weak var createNewTask: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet var viewBackground: UIView!
    @IBOutlet weak var pencil: UIButton!
    
    var getColor = UIColor()
    var getName = String()
    var getTask = String()
    var getLettersColor = UIColor()
    
    var arrayTasks: [ToDoTask] = []
           
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailListTableView.delegate = self
        detailListTableView.dataSource = self
        
        detailListTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: TableViewCell.identifier)
        
        createNewTask.layer.cornerRadius = createNewTask.frame.height / 2
        createNewTask.backgroundColor = UIColor.white
        createNewTask.layer.shadowOpacity = 0.25
        createNewTask.layer.shadowRadius = 5
        createNewTask.layer.shadowOffset = CGSize(width: 0, height: 10)
        createNewTask.setImage(#imageLiteral(resourceName: "Combined Shape"), for: .normal)
        
        if getLettersColor == UIColor.rgb(red: 255, green: 255, blue: 255) {
            pencil.setImage(#imageLiteral(resourceName: "whitePensel"), for: .normal)
        } else {
            pencil.setImage(#imageLiteral(resourceName: "darkPensel"), for: .normal)
        }
        
        viewBackground.backgroundColor = getColor
        nameLabel.text = getName
        nameLabel.textColor = getLettersColor
        taskLabel.text = getTask
        taskLabel.textColor = getLettersColor
        detailListTableView.backgroundColor = getColor
        
        for item in 0...DataToDo.shared.tasks.count - 1{
            if DataToDo.shared.tasks[item].markColor == getColor {
                arrayTasks.append(DataToDo.shared.tasks[item])
            }
        }
        
    }
}


extension DetailsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        var countOfLine = 0
//        for item in 0...DataToDo.shared.tasks.count - 1{
//            if DataToDo.shared.tasks[item].markColor == getColor {
//                countOfLine = countOfLine + 1
//            }
//        }
        
        return arrayTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        
        
        cell.backgroundColor = getColor
        cell.taskLabel.textColor = getLettersColor
        cell.checkBoxImageView.image = #imageLiteral(resourceName: "Unmarked")
        
        if getLettersColor == UIColor.rgb(red: 255, green: 255, blue: 255) {
            cell.checkBoxImageView.image = #imageLiteral(resourceName: "UnmarkedWhite")
        } else {
            cell.checkBoxImageView.image = #imageLiteral(resourceName: "Unmarked")
        }
    
        cell.taskLabel.text = arrayTasks[indexPath.row].title
    
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
