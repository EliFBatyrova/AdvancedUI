//
//  TaskTableViewCell.swift
//  AdvancedUI
//
//  Created by Евгений on 26.09.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell, ClickableCell, PaintableCell {

    
    @IBOutlet weak var taskOvalButton: UIButton!
    @IBOutlet weak var listMarkerView: UIView!
    @IBOutlet weak var taskTextLabel: UILabel!
    
    var isChecked = false
    
    @IBAction func didPressOvalButton(_ sender: Any) {
    }
    
    func configure(with task: Task) {
        
        switch task.category {
            
        case .inbox:
            self.listMarkerView.isHidden = true
        case .work:
            self.listMarkerView.backgroundColor = UIColor(hexString: "#61DEA4")
        case .family:
            self.listMarkerView.backgroundColor = UIColor(hexString: "#FFE761")
        case .shopping:
            self.listMarkerView.backgroundColor = UIColor(hexString: "#F45E6D")
        case .personal:
            self.listMarkerView.backgroundColor = UIColor(hexString: "#B678FF")
        }
        
        self.taskTextLabel.text = task.text
    }
    
    func selectCell() {
        if isChecked {
            self.taskOvalButton.imageView?.image = UIImage(named: "unmarked")
            self.taskTextLabel.alpha = 1
            self.isChecked = false
        } else {
            self.taskOvalButton.imageView?.image = UIImage(named: "marked")
            self.taskTextLabel.alpha = 0.5
            self.isChecked = true
        }
    }
    
    func paintCell(for category: Categories) {
        self.listMarkerView.isHidden = true
        switch category {
        case .inbox:
            self.backgroundColor = UIColor(hexString: "#EBEFF5")
        case .work:
            self.backgroundColor = UIColor(hexString: "#61DEA4")
            self.taskTextLabel.textColor = UIColor.white
            self.taskOvalButton.imageView?.image = UIImage(named: "whiteUnmarked")
        case .family:
            self.backgroundColor = UIColor(hexString: "#FFE761")
        case .shopping:
            self.backgroundColor = UIColor(hexString: "#F45E6D")
            self.taskTextLabel.textColor = UIColor.white
            self.taskOvalButton.imageView?.image = UIImage(named: "whiteUnmarked")
        case .personal:
            self.backgroundColor = UIColor(hexString: "#B678FF")
            self.taskTextLabel.textColor = UIColor.white
            self.taskOvalButton.imageView?.image = UIImage(named: "whiteUnmarked")
        }
    }
}
