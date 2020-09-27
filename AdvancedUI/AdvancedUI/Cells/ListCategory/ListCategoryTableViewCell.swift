//
//  ListCategoryTableViewCell.swift
//  AdvancedUI
//
//  Created by Евгений on 27.09.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit

class ListCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryBackgroundView: UIView!
    @IBOutlet weak var numberOfTasksLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    func configure(with category: Category) {
        
        switch category.category {
                
            case .inbox:
                self.categoryBackgroundView.backgroundColor = UIColor(hexString: "#EBEFF5")
            case .work:
                self.categoryBackgroundView.backgroundColor = UIColor(hexString: "#61DEA4")
                self.categoryLabel.textColor = UIColor.white
                self.numberOfTasksLabel.textColor = UIColor.white
                self.categoryLabel.alpha = 0.9
                self.numberOfTasksLabel.alpha = 0.5
            case .family:
                self.categoryBackgroundView.backgroundColor = UIColor(hexString: "#FFE761")
            case .shopping:
                self.categoryBackgroundView.backgroundColor = UIColor(hexString: "#F45E6D")
                self.categoryLabel.textColor = UIColor.white
                self.numberOfTasksLabel.textColor = UIColor.white
                self.categoryLabel.alpha = 0.9
                self.numberOfTasksLabel.alpha = 0.5
            case .personal:
                self.categoryBackgroundView.backgroundColor = UIColor(hexString: "#B678FF")
                self.categoryLabel.textColor = UIColor.white
                self.numberOfTasksLabel.textColor = UIColor.white
                self.categoryLabel.alpha = 0.9
                self.numberOfTasksLabel.alpha = 0.5
            }
            
        self.categoryLabel.text = category.name
        self.numberOfTasksLabel.text = category.numberOfTasks > 1 ? "\(category.numberOfTasks) tasks" : "\(category.numberOfTasks) task"
        }
    }
