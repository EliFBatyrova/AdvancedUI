//
//  ViewController.swift
//  Lesson1
//
//  Created by Emil Mubarakov on 25.09.2020.
//  Copyright © 2020 Emil Mubarakov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //MARK: - Code ViewControoler

    @IBOutlet weak var createNewTask: UIButton!
    @IBOutlet weak var tableViewToDo: UITableView!
    @IBOutlet weak var opacitiView: UIView!
    @IBOutlet weak var createListOrTaskView: UIView!
    @IBOutlet weak var createTaskButton: UIButton!
    @IBOutlet weak var createListButton: UIButton!
    
    var plusImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewToDo.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: TableViewCell.identifier)
        tableViewToDo.register(UINib(nibName: "NameTableViewCell", bundle: nil), forCellReuseIdentifier: NameTableViewCell.identifier)
        tableViewToDo.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: ListTableViewCell.identifier)
        
        createNewTask.layer.cornerRadius = createNewTask.frame.height / 2
        createNewTask.backgroundColor = UIColor.white
        createNewTask.layer.shadowOpacity = 0.25
        createNewTask.layer.shadowRadius = 5
        createNewTask.layer.shadowOffset = CGSize(width: 0, height: 10)
        createNewTask.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        
        opacitiView.isHidden = true
        opacitiView.backgroundColor = UIColor.white
        opacitiView.layer.opacity = 0.7
        
        tableViewToDo.dataSource = self
        tableViewToDo.delegate = self
        tableViewToDo.separatorStyle = .none
        
        createListOrTaskView.layer.cornerRadius = 15
        createListOrTaskView.isHidden = true
        createListOrTaskView.layer.shadowOpacity = 0.25
        createListOrTaskView.layer.shadowRadius = 5
        createListOrTaskView.layer.shadowOffset = CGSize(width: 0, height: 10)
        
        plusImages = createImageArray(total: 5, imagePrefix: "Plus")
        
    }
    
    func createImageArray(total: Int, imagePrefix: String) -> [UIImage] {
        
        var imageArray: [UIImage] = []
        
        for imageCount in 0..<total {
            let imageName = "\(imagePrefix)\(imageCount).png"
            let image = UIImage(named: imageName)!
            
            imageArray.append(image)
        }
        return imageArray
    }
    
    func animate(imageView: UIImageView, images: [UIImage]) {
        imageView.animationImages = images
        imageView.animationDuration = 0.5
        imageView.animationRepeatCount = 1
        imageView.startAnimating()
    }
    
    @IBAction func createNewTaskActionButton(_ sender: Any) {
        opacitiView.isHidden = !opacitiView.isHidden
        createListOrTaskView.isHidden = !createListOrTaskView.isHidden
        
        if opacitiView.isHidden == true {
            UIView.animate(withDuration: 0.5) {
                self.createNewTask.backgroundColor = UIColor.white
            }
            animate(imageView: createNewTask.imageView!, images: plusImages.reversed())
            createNewTask.setImage(#imageLiteral(resourceName: "Plus0.png"), for: .normal)
        } else {
            UIView.animate(withDuration: 0.5) {
                self.createNewTask.backgroundColor = UIColor.rgb(red: 10, green: 132, blue: 255)
            }
            animate(imageView: createNewTask.imageView!, images: plusImages)
            createNewTask.setImage(#imageLiteral(resourceName: "Plus4.png"), for: .normal)
        }
    }
    
    


}

//MARK: - Extension ViewController


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataToDo.shared.tasks.count + 1 + DataToDo.shared.lists.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < 3 || indexPath.row > 3 && indexPath.row < 5 {
            return 60
        } else if indexPath.row == 3 {
            return 81
        } else if indexPath.row == 5 {
            return 59
        }
        return 77
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
            
            let todo = DataToDo.shared.tasks[indexPath.row]
            
            cell.taskLabel.text = todo.title
            cell.taskMarkView.backgroundColor = todo.markColor
            cell.checkBoxImageView.image = todo.isMarked == true ? UIImage(named: "Marked") : UIImage(named: "Unmarked")
            cell.taskLabel.layer.opacity = todo.opacity == 1 ? 1 : 0.5
            
            cell.selectionStyle = .none
            
            return cell
        } else if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: NameTableViewCell.identifier, for: indexPath) as! NameTableViewCell
            cell.listNameLabel.text = "Lists"
            cell.selectionStyle = .none
                
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as! ListTableViewCell
        
        let tasks = DataToDo.shared.lists[indexPath.row - 6]
        
        cell.listNameLabel.text = tasks.listName
        cell.tasksView.backgroundColor = tasks.backgroundColor
        cell.countTasksLabel.text = tasks.countTasks
        cell.listNameLabel.textColor = tasks.lettersColor
        cell.countTasksLabel.textColor = tasks.lettersColor
        
        cell.selectionStyle = .none
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row < 5 {
        
            guard let cell = tableView.cellForRow(at: indexPath) as? TableViewCell else {return}
            
            var todo = DataToDo.shared.tasks[indexPath.row]
            todo.isMarked = !todo.isMarked
            if todo.isMarked == true {
                todo.opacity = 0.5
            } else {
                todo.opacity = 1
            }
            
            DataToDo.shared.tasks.remove(at: indexPath.row)
            DataToDo.shared.tasks.insert(todo, at: indexPath.row)
            
            cell.taskLabel.layer.opacity = todo.opacity == 1 ? 1 : 0.5
            cell.checkBoxImageView.image = todo.isMarked == true ? UIImage(named: "Marked") : UIImage(named: "Unmarked")
            
        }
        
        if indexPath.row > 5 {
            
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let DvC = storyboard.instantiateViewController(withIdentifier: "DetailsListViewController") as! DetailsListViewController
            
            guard let cell = tableView.cellForRow(at: indexPath) as? ListTableViewCell else {return}
        
            
            DvC.listColor = cell.tasksView.backgroundColor!
            DvC.listName = cell.listNameLabel.text!
            DvC.listTask = cell.countTasksLabel.text!
            DvC.listLettersColor = cell.listNameLabel.textColor
            
            self.present(DvC, animated: true)
            
        }
    }
    
    
}

