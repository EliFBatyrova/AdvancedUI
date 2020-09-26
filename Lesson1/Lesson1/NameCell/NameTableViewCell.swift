//
//  NameTableViewCell.swift
//  Lesson1
//
//  Created by Emil Mubarakov on 25.09.2020.
//  Copyright © 2020 Emil Mubarakov. All rights reserved.
//

import UIKit

class NameTableViewCell: UITableViewCell {
    
    static let identifier = "nameTableViewCell"

    @IBOutlet weak var listNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        listNameLabel.layer.opacity = 0.3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
