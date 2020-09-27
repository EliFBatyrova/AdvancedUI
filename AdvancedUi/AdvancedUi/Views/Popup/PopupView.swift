//
//  PopupView.swift
//  AdvancedUi
//
//  Created by Amir on 27.09.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

class PopupView: UIView {
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var taskImageView: UIImageView!
    @IBOutlet weak var listImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initViews()
    }
    
    private func initViews() {
        
        Bundle.main.loadNibNamed("PopupView", owner: self, options: nil)
        
        addSubview(mainView)
        mainView.frame = bounds
        mainView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        taskImageView.image = #imageLiteral(resourceName: "Task")
        listImageView.image = #imageLiteral(resourceName: "Lists")
        
        addShadow(color: #colorLiteral(red: 0.08235294118, green: 0.137254902, blue: 0.2196078431, alpha: 0.2), radius: 30, height: 10)
    }
}
