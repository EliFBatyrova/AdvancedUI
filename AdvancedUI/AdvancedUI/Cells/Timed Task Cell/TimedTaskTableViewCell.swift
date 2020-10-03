//
//  TimedTaskTableViewCell.swift
//  AdvancedUI
//
//  Created by Enoxus on 20.09.2020.
//  Copyright © 2020 Enoxus. All rights reserved.
//

import UIKit

class TimedTaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var markedImageView: UIImageView!
    @IBOutlet weak var listMarkView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstSubLabelImageView: UIImageView!
    @IBOutlet weak var firstSubLabelTitleLabel: UILabel!
    @IBOutlet weak var secondSubLabelImageView: UIImageView!
    @IBOutlet weak var secondSubLabelTitleLabel: UILabel!
    @IBOutlet weak var firstSubLabelContainer: UIView!
    @IBOutlet weak var secondSubLabelContainer: UIView!
    @IBOutlet weak var separatorView: UIView!
    
    var viewModel: TaskViewModel!
    
    func configure(with viewModel: TaskViewModel) {
        
        self.viewModel = viewModel
        
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

        
        if let type = viewModel.listType {
            
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
        else {
            listMarkView.backgroundColor = .clear
        }
        
        guard let subLabelConfig = viewModel.subLabelConfiguration else { return }
        firstSubLabelContainer.isHidden = false
        firstSubLabelImageView.image = UIImage(named: subLabelConfig.firstSubLabelImage)
        firstSubLabelTitleLabel.text = subLabelConfig.firstSubLabelText
        
        if viewModel.hasLightAppearance {
            firstSubLabelTitleLabel.textColor = UIColor.white.withAlphaComponent(viewModel.isMarked ? 0.25 : 0.5)
        }
        else {
            firstSubLabelTitleLabel.textColor = UIColor.defaultBlack.withAlphaComponent(viewModel.isMarked ? 0.15 : 0.3)
        }
        firstSubLabelImageView.alpha = viewModel.isMarked ? 0.5 : 1
         
        guard let secondSubLabelText = subLabelConfig.secondSubLabelText,
            let secondSubLabelImage = subLabelConfig.secondSubLabelImage else { return }
        secondSubLabelContainer.isHidden = false
        secondSubLabelImageView.image = UIImage(named: secondSubLabelImage)
        secondSubLabelTitleLabel.text = secondSubLabelText
        
        if viewModel.hasLightAppearance {
            secondSubLabelTitleLabel.textColor = UIColor.white.withAlphaComponent(viewModel.isMarked ? 0.25 : 0.5)
        }
        else {
            secondSubLabelTitleLabel.textColor = UIColor.defaultBlack.withAlphaComponent(viewModel.isMarked ? 0.15 : 0.3)
        }
        
        secondSubLabelImageView.alpha = viewModel.isMarked ? 0.5 : 1
    }
}

extension TimedTaskTableViewCell: SelectableCell {
    
    func toggleMark() {
        
        viewModel.isMarked.toggle()
        configure(with: viewModel)
    }
}
