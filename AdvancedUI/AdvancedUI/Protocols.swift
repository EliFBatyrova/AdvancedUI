//
//  Protocols.swift
//  AdvancedUI
//
//  Created by Евгений on 27.09.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

protocol ClickableCell {
    func selectCell()
}

protocol PaintableCell {
    func paintCell(for category: Categories)
}
