//
//  ListTableViewCell.swift
//  Lesson1
//
//  Created by Emil Mubarakov on 25.09.2020.
//  Copyright © 2020 Emil Mubarakov. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tasksView: UIView!
    @IBOutlet weak var listNameLabel: UILabel!
    @IBOutlet weak var countTasksLabel: UILabel!
    
    static var identifier = "listTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        tasksView.layer.cornerRadius = 10
        listNameLabel.layer.opacity = 0.9
        countTasksLabel.layer.opacity = 0.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

