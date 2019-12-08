//
//  BackButton.swift
//  strategyGame
//
//  Created by Cassia Aparecida Barbosa on 08/12/19.
//  Copyright © 2019 teamStrategyGame. All rights reserved.
//

import SpriteKit

class BackButton: Button {
    
    override init(rect: CGRect, text: String) {
           super.init(rect: rect, text: "Back")
       }
       
       override func press() {
           self.pressed = true
       }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
}
