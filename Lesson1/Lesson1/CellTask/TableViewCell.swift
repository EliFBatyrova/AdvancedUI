//
//  TableViewCell.swift
//  Lesson1
//
//  Created by Emil Mubarakov on 25.09.2020.
//  Copyright © 2020 Emil Mubarakov. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "tableViewCell"

    @IBOutlet weak var taskMarkView: UIView!
    @IBOutlet weak var checkBoxImageView: UIImageView!
    @IBOutlet weak var taskLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        taskMarkView.layer.cornerRadius = 6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
