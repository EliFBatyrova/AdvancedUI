//
//  FabView.swift
//  AdvancedUI
//
//  Created by Enoxus on 21.09.2020.
//  Copyright © 2020 Enoxus. All rights reserved.
//

import UIKit

class FabView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var plusButton: UIButton!
    
    public var handler: ((Bool) -> Void)?
    
    private var activated: Bool = false {
        
        didSet {
            
            guard let handler = handler else { return }
            
            handler(activated)
            
            if activated {
                
                UIView.animate(withDuration: 0.4, delay: .zero, options: .curveEaseOut, animations: {
                    
                    self.plusButton.transform = CGAffineTransform(rotationAngle: -.pi / 4)
                    self.contentView.backgroundColor = .defaultBlue
                    self.plusButton.tintColor = .white
                }, completion: nil)
            }
            else {
                
                UIView.animate(withDuration: 0.4, delay: .zero, options: .curveEaseOut, animations: {
                    
                    self.plusButton.transform = .identity
                    self.contentView.backgroundColor = .white
                    self.plusButton.tintColor = .defaultBlue
                }, completion: nil)
            }
        }
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        
        Bundle.main.loadNibNamed("Fab", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    @IBAction func plusButtonTouchUpInside() {
        
        activated.toggle()
    }
}
