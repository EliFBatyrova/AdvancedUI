//
//  SubtitledLargeTitleTableViewCell.swift
//  AdvancedUI
//
//  Created by Enoxus on 21.09.2020.
//  Copyright © 2020 Enoxus. All rights reserved.
//

import UIKit

class SubtitledLargeTitleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    func configure(with viewModel: ListCellViewModel) {
        
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        
        switch viewModel.type {
            
        case .inbox:
            
            editButton.setImage(UIImage(named: "edit_black"), for: .normal)
            titleLabel.textColor = .darkListTitleColor
            subtitleLabel.textColor = .darkListSubtitleColor
        case .work:
            
            editButton.setImage(UIImage(named: "edit_white"), for: .normal)
            titleLabel.textColor = .lightListTitleColor
            subtitleLabel.textColor = .lightListSubtitleColor
        case .shopping:
            
            editButton.setImage(UIImage(named: "edit_white"), for: .normal)
            titleLabel.textColor = .lightListTitleColor
            subtitleLabel.textColor = .lightListSubtitleColor
        case .family:
            
            editButton.setImage(UIImage(named: "edit_black"), for: .normal)
            titleLabel.textColor = .darkListTitleColor
            subtitleLabel.textColor = .darkListSubtitleColor
        case .personal:
            
            editButton.setImage(UIImage(named: "edit_white"), for: .normal)
            titleLabel.textColor = .lightListTitleColor
            subtitleLabel.textColor = .lightListSubtitleColor
        }
    }
}
