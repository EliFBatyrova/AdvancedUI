//
//  ListTableViewCell.swift
//  AdvancedUI
//
//  Created by Enoxus on 20.09.2020.
//  Copyright © 2020 Enoxus. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    func configure(with viewModel: ListCellViewModel) {
        
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        
        switch viewModel.type {
            
        case .inbox:
            
            containerView.backgroundColor = .listGrey
            titleLabel.textColor = .darkListTitleColor
            subtitleLabel.textColor = .darkListSubtitleColor
        case .work:
            
            containerView.backgroundColor = .listGreen
            titleLabel.textColor = .lightListTitleColor
            subtitleLabel.textColor = .lightListSubtitleColor
        case .shopping:
            
            containerView.backgroundColor = .listRed
            titleLabel.textColor = .lightListTitleColor
            subtitleLabel.textColor = .lightListSubtitleColor
        case .family:
            
            containerView.backgroundColor = .listYellow
            titleLabel.textColor = .darkListTitleColor
            subtitleLabel.textColor = .darkListSubtitleColor
        case .personal:
            
            containerView.backgroundColor = .listPurple
            titleLabel.textColor = .lightListTitleColor
            subtitleLabel.textColor = .lightListSubtitleColor
        }
    }
}
