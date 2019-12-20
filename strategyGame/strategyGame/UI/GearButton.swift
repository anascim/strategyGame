//
//  GearButton.swift
//  strategyGame
//
//  Created by Cassia Aparecida Barbosa on 09/12/19.
//  Copyright © 2019 teamStrategyGame. All rights reserved.
//

import SpriteKit

class GearButton: Button {
    
    init(rect: CGRect) {
        super.init(rect: rect, text: "")
        self.buttonNormalTex = SKTexture(imageNamed: "settingsbutton")
        self.buttonPressedTex = SKTexture(imageNamed: "SettingsButtonPressed")
        self.texture = SKTexture(imageNamed: "settingsbutton")
    }
    
    override func press() {
        self.pressed = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
