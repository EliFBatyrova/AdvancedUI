//
//  ViewController.swift
//  AdvancedUi
//
//  Created by Amir on 20.09.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {

    @IBOutlet weak var addButtton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    private var isAddButtonAcivated: Bool = false {
        didSet {
            
            addButtton.backgroundColor = isAddButtonAcivated ? #colorLiteral(red: 0, green: 0.423999995, blue: 1, alpha: 1) : .white
            addButtton.imageView?.tintColor = isAddButtonAcivated ? .white : #colorLiteral(red: 0, green: 0.423999995, blue: 1, alpha: 1)
            addButtton.transform = isAddButtonAcivated
                ? CGAffineTransform(rotationAngle: CGFloat.pi / 4)
                : .identity
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
    }
    
    private func initViews() {
                
        addButtonSettings()
        tasksTableViewSettings()
    }
    
    private func tasksTableViewSettings() {
//        tasksTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func addButtonSettings() {
                
        addButtton.imageView?.frame.size = CGSize(width: 18, height: 18)
        addButtton.layer.cornerRadius = addButtton.frame.height / 2
    }
        
    @IBAction func addButtonPressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3) {
            self.isAddButtonAcivated.toggle()
        }
    }
}

extension TodayViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "jhaebvehj"
        return cell
        
    }
}
