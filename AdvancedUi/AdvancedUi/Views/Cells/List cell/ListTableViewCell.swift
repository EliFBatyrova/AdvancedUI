//
//  ListTableViewCell.swift
//  AdvancedUi
//
//  Created by Amir on 27.09.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    //MARK: - UI elements
    @IBOutlet private weak var backView: UIView!
    
    @IBOutlet private weak var mainStackView: UIStackView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    //MARK: - Constants
    private let tasksText = "tasks"
    private let backViewCornerRadius: CGFloat = 10
    public let cellHeight: CGFloat = 78
    
    //MARK: - UI configuring
    func configure(with list: ListModel) {
        
        self.selectionStyle = .none
        backView.layer.cornerRadius = backViewCornerRadius
        
        titleLabel.text = list.type.rawValue
        subtitleLabel.text = "\(list.tasks.count) " + tasksText
        
        switch list.type {
        
        case .inbox, .family:
            titleLabel.textColor = #colorLiteral(red: 0.1449999958, green: 0.1650000066, blue: 0.1920000017, alpha: 1).withAlphaComponent(0.9)
            subtitleLabel.textColor = #colorLiteral(red: 0.1449999958, green: 0.1650000066, blue: 0.1920000017, alpha: 1).withAlphaComponent(0.5)
        case .personal:
            subtitleLabel.textColor = .white
            titleLabel.textColor = .white
        case .work, .shopping:
            subtitleLabel.textColor = UIColor.white.withAlphaComponent(0.5)
            titleLabel.textColor = UIColor.white.withAlphaComponent(0.9)
        case .none: return
        }
        
        setBackViewBackgroundColor(with: list.type)
        
    }
    
    private func setBackViewBackgroundColor(with type: TaskType) {
        
        var backViewbackgroundColor = UIColor.white
                
        switch type {
        
        case .inbox:
            backViewbackgroundColor = #colorLiteral(red: 0.9219999909, green: 0.9369999766, blue: 0.9610000253, alpha: 1)
        case .family:
            backViewbackgroundColor = #colorLiteral(red: 1, green: 0.9060000181, blue: 0.3799999952, alpha: 1)
        case .personal:
            backViewbackgroundColor = #colorLiteral(red: 0.7139999866, green: 0.4709999859, blue: 1, alpha: 1)
        case .work:
            backViewbackgroundColor = #colorLiteral(red: 0.3799999952, green: 0.8709999919, blue: 0.6430000067, alpha: 1)
        case .shopping:
            backViewbackgroundColor = #colorLiteral(red: 0.9570000172, green: 0.3689999878, blue: 0.4269999862, alpha: 1)
        case .none: return
        }
        
        backView.backgroundColor = backViewbackgroundColor
    }
    
}
