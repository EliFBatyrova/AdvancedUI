//
//  PlusButtonView.swift
//  AdvancedUi
//
//  Created by Amir on 27.09.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

protocol PlusButtonViewDelegate: AnyObject {
    func didPressPlusButton(buttonState: Bool)
}

class PlusButtonView: UIView {
    
    @IBOutlet weak var plusButton: UIButton!    
    @IBOutlet var backView: UIView!
    
    weak var delegate: PlusButtonViewDelegate?
    
    private var isAddButtonAcivated: Bool = false {
        didSet {
            
            delegate?.didPressPlusButton(buttonState: isAddButtonAcivated)
            
            backView.backgroundColor = isAddButtonAcivated ? #colorLiteral(red: 0, green: 0.423999995, blue: 1, alpha: 1) : .white
            plusButton.tintColor = isAddButtonAcivated ? .white : #colorLiteral(red: 0, green: 0.423999995, blue: 1, alpha: 1)
            plusButton.transform = isAddButtonAcivated
                ? CGAffineTransform(rotationAngle: .pi / 4)
                : .identity
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initViews()
    }
    
    private func initViews() {
        
        Bundle.main.loadNibNamed("PlusButtonView", owner: self, options: nil)
        addSubview(backView)
        backView.frame = bounds
        backView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addShadow(color: #colorLiteral(red: 0.08235294118, green: 0.137254902, blue: 0.2196078431, alpha: 0.16), radius: 32, height: 24)
    }
    
    @IBAction func plusButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.isAddButtonAcivated.toggle()
        }
    }
}
