//
//  TaskTableViewCell.swift
//  AdvancedUI
//
//  Created by Enoxus on 20.09.2020.
//  Copyright © 2020 Enoxus. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var markedImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var listMarkView: UIView!
    @IBOutlet weak var separatorView: UIView!
    
    func configure(with viewModel: TaskViewModel) {
        
        let unmarkedImageName = viewModel.hasLightAppearance ? "unmarked_light" : "unmarked"
        markedImageView.image = UIImage(named: viewModel.isMarked ? "marked" : unmarkedImageName)
        titleLabel.text = viewModel.title
        
        if viewModel.hasLightAppearance {
            
            separatorView.backgroundColor = UIColor.white.withAlphaComponent(0.2)
            titleLabel.textColor = UIColor.white.withAlphaComponent(viewModel.isMarked ? 0.5 : 1)
        }
        else {
            titleLabel.textColor = UIColor.defaultBlack.withAlphaComponent(viewModel.isMarked ? 0.5 : 1)
        }
        
        guard let type = viewModel.listType else {
            
            listMarkView.backgroundColor = .clear
            return
        }
        
        switch type {
            
        case .inbox:
            listMarkView.backgroundColor = .listGrey
        case .work:
            listMarkView.backgroundColor = .listGreen
        case .shopping:
            listMarkView.backgroundColor = .listRed
        case .family:
            listMarkView.backgroundColor = .listYellow
        case .personal:
            listMarkView.backgroundColor = .listPurple
        }
    }
}
