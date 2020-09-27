//
//  TaskWithTimeTableViewCell.swift
//  AdvancedUI
//
//  Created by Евгений on 27.09.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit

class TaskWithTimeTableViewCell: UITableViewCell, ClickableCell, PaintableCell {

    @IBOutlet weak var clockImageView: UIImageView!
    @IBOutlet weak var calendarImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var taskOvalView: UIImageView!
    @IBOutlet weak var listMarkerView: UIView!
    @IBOutlet weak var taskTextLabel: UILabel!

    @IBAction func didPressOvalButton(_ sender: Any) {
    }
    
    var isChecked = false
    
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
        
        if let date = task.date {
            self.dateLabel.text = date
        } else {
            self.dateLabel.isHidden = true
            self.calendarImageView.isHidden = true
        }
        
        if let time = task.time {
            self.timeLabel.text = time
        } else {
            self.timeLabel.isHidden = true
            self.clockImageView.isHidden = true
        }
    }
    
    func selectCell() {
        if isChecked {
            self.taskOvalView.image = UIImage(named: "unmarked")
            self.taskTextLabel.alpha = 1
            self.isChecked = false
        } else {
            self.taskOvalView.image = UIImage(named: "marked")
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
            self.taskTextLabel.textColor = .white
            self.clockImageView.tintColor = .white
            self.timeLabel.textColor = .white
            self.calendarImageView.tintColor = .white
            self.dateLabel.textColor = .white
            self.clockImageView.alpha = 0.5
            self.timeLabel.alpha = 0.5
            self.calendarImageView.alpha = 0.5
            self.dateLabel.alpha = 0.5
            self.taskOvalView.image = UIImage(named: "whiteUnmarked")
            self.calendarImageView.image = UIImage(named: "whiteCalendar")
            self.clockImageView.image = UIImage(named: "whiteClock")
            
        case .family:
            self.backgroundColor = UIColor(hexString: "#FFE761")
        case .shopping:
            self.backgroundColor = UIColor(hexString: "#F45E6D")
            self.taskTextLabel.textColor = .white
            self.clockImageView.tintColor = .white
            self.timeLabel.textColor = .white
            self.calendarImageView.tintColor = .white
            self.dateLabel.textColor = .white
            self.clockImageView.alpha = 0.5
            self.timeLabel.alpha = 0.5
            self.calendarImageView.alpha = 0.5
            self.dateLabel.alpha = 0.5
            self.taskOvalView.image = UIImage(named: "whiteUnmarked")
            self.calendarImageView.image = UIImage(named: "whiteCalendar")
            self.clockImageView.image = UIImage(named: "whiteClock")
        case .personal:
            self.backgroundColor = UIColor(hexString: "#B678FF")
            self.taskTextLabel.textColor = .white
            self.clockImageView.tintColor = .white
            self.timeLabel.textColor = .white
            self.calendarImageView.tintColor = .white
            self.dateLabel.textColor = .white
            self.clockImageView.alpha = 0.5
            self.timeLabel.alpha = 0.5
            self.calendarImageView.alpha = 0.5
            self.dateLabel.alpha = 0.5
            self.taskOvalView.image = UIImage(named: "whiteUnmarked")
            self.calendarImageView.image = UIImage(named: "whiteCalendar")
            self.clockImageView.image = UIImage(named: "whiteClock")
        }
    }
    
}
