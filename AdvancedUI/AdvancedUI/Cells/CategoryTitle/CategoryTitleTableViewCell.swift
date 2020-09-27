//
//  CategoryTitleTableViewCell.swift
//  AdvancedUI
//
//  Created by Евгений on 27.09.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit

class CategoryTitleTableViewCell: UITableViewCell, PaintableCell {

    override func awakeFromNib() {
        super.awakeFromNib()

        self.selectionStyle = .none
    }
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var numberOfTasksLabel: UILabel!
    
    func configure(with category: Category) {
        self.categoryLabel.text = category.name
        self.numberOfTasksLabel.text = category.numberOfTasks > 1 ? "\(category.numberOfTasks) tasks" : "\(category.numberOfTasks) task"
    }
    
    func paintCell(for category: Categories) {
        switch category {
        case .inbox:
            self.backgroundColor = UIColor(hexString: "#EBEFF5")
        case .work:
            self.backgroundColor = UIColor(hexString: "#61DEA4")
            self.categoryLabel.textColor = UIColor.white
            self.numberOfTasksLabel.textColor = UIColor.white
            self.numberOfTasksLabel.alpha = 0.5
            self.editButton.imageView?.image = UIImage(named: "whiteEdit")
        case .family:
            self.backgroundColor = UIColor(hexString: "#FFE761")
        case .shopping:
            self.backgroundColor = UIColor(hexString: "#F45E6D")
            self.categoryLabel.textColor = UIColor.white
            self.numberOfTasksLabel.textColor = UIColor.white
            self.numberOfTasksLabel.alpha = 0.5
            self.editButton.imageView?.image = UIImage(named: "whiteEdit")
        case .personal:
            self.backgroundColor = UIColor(hexString: "#B678FF")
            self.categoryLabel.textColor = UIColor.white
            self.numberOfTasksLabel.textColor = UIColor.white
            self.numberOfTasksLabel.alpha = 0.5
            self.editButton.imageView?.image = UIImage(named: "whiteEdit")
        }
    }
}
