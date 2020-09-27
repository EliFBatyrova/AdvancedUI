//
//  TaskTableViewCell.swift
//  AdvancedUi
//
//  Created by Amir on 21.09.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    //MARK: - UI elements
    @IBOutlet private weak var mainStackView: UIStackView!
    @IBOutlet private weak var checkboxButton: UIButton!
    
    @IBOutlet private weak var taskNameLabel: UILabel!
    
    @IBOutlet private weak var typeIndicatorView: UIView!
   
    @IBOutlet private weak var taskDeadlineStack: UIStackView!
    
    @IBOutlet private weak var taskDateLabel: UILabel!
    @IBOutlet private weak var taskDateStack: UIStackView!
    
    @IBOutlet private weak var taskTimeLabel: UILabel!
    @IBOutlet private weak var taskTimeStack: UIStackView!
    
    @IBOutlet private weak var separatorLine: UIView!
    
    //MARK: - Flag
    public var isCheckboxChecked: Bool! {
        didSet {
            
            let alpha: CGFloat = isCheckboxChecked ? 0.5 : 1
            
            taskNameLabel.textColor = #colorLiteral(red: 0.1449999958, green: 0.1650000066, blue: 0.1920000017, alpha: 1).withAlphaComponent(alpha)
            taskDeadlineStack.alpha = alpha
            
            checkboxButton.setImage(isCheckboxChecked ? #imageLiteral(resourceName: "marked") : #imageLiteral(resourceName: "unmarkedDark"), for: .normal)
        }
    }
    
    func configure(with task: TaskModel) {
                
        isCheckboxChecked = task.isFinished
        
        taskNameLabel.text = task.name
        
        switch task.type {
        case .family:
            indicatorViewSettings()
            typeIndicatorView.backgroundColor = #colorLiteral(red: 1, green: 0.9060000181, blue: 0.3799999952, alpha: 1)
        case .inbox:
            typeIndicatorView.isHidden = true
        case .work:
            indicatorViewSettings()
            typeIndicatorView.backgroundColor = #colorLiteral(red: 0.3799999952, green: 0.8709999919, blue: 0.6430000067, alpha: 1)
        case .personal:
            indicatorViewSettings()
            typeIndicatorView.backgroundColor = #colorLiteral(red: 0.7139999866, green: 0.4709999859, blue: 1, alpha: 1)
        case .shopping:
            indicatorViewSettings()
            typeIndicatorView.backgroundColor = #colorLiteral(red: 0.9570000172, green: 0.3689999878, blue: 0.4269999862, alpha: 1)
        case .none:
            typeIndicatorView.isHidden = true
        }
        
        guard let deadline = task.dateEnd else {
            taskDeadlineStack.isHidden = true
            return
        }
        
        setupDeadlineLabels(with: deadline, withEndDate: false)
    }
    
    func configureWithoutIndicator(with task: TaskModel) {
        
        isCheckboxChecked = task.isFinished
        typeIndicatorView.isHidden = true
        
        taskNameLabel.text = task.name
        
        switch task.type {
        case .family:
            backgroundColor = #colorLiteral(red: 1, green: 0.9060000181, blue: 0.3799999952, alpha: 1)
            checkboxButton.tintColor = #colorLiteral(red: 0.1449999958, green: 0.1650000066, blue: 0.1920000017, alpha: 1)
        case .inbox:
            backgroundColor = #colorLiteral(red: 0.9219999909, green: 0.9369999766, blue: 0.9610000253, alpha: 1)
            checkboxButton.tintColor = #colorLiteral(red: 0.1449999958, green: 0.1650000066, blue: 0.1920000017, alpha: 1)
        case .work:
            commonColor(.white)
            backgroundColor = #colorLiteral(red: 0.3799999952, green: 0.8709999919, blue: 0.6430000067, alpha: 1)
        case .personal:
            commonColor(.white)
            backgroundColor = #colorLiteral(red: 0.7139999866, green: 0.4709999859, blue: 1, alpha: 1)
        case .shopping:
            commonColor(.white)
            backgroundColor = #colorLiteral(red: 0.9570000172, green: 0.3689999878, blue: 0.4269999862, alpha: 1)
        case .none: return
        }
        
        guard let deadline = task.dateEnd else {
            taskDeadlineStack.isHidden = true
            return
        }
        
        setupDeadlineLabels(with: deadline, withEndDate: true)
    }
    
    private func commonColor(_ color: UIColor) {
        
        taskNameLabel.textColor = color
        separatorLine.backgroundColor = color
        self.color(stack: taskDateStack, in: color)
        self.color(stack: taskTimeStack, in: color)
        checkboxButton.tintColor = .white
    }
    
    private func color(stack: UIStackView, in color: UIColor) {
        
        stack.arrangedSubviews.forEach {
            switch $0 {
            case is UIImageView:
                $0.tintColor = color
            case let label as UILabel:
                label.textColor = color
            default: return
            }
        }
    }
    
    private func setupDeadlineLabels(with deadline: TaskModel.DateEndModel, withEndDate: Bool) {
        
        if let taskDateEndText = deadline.endDay, withEndDate {
            taskDateLabel.text = taskDateEndText
        } else {
            taskDateStack.isHidden = true
        }
        
        if let taskTimeEndText = deadline.endTime {
            taskTimeLabel.text = taskTimeEndText
        } else {
            taskTimeStack.isHidden = true
        }
    }
    
    private func indicatorViewSettings() {
        typeIndicatorView.layer.cornerRadius = typeIndicatorView.frame.height / 2
    }
}
