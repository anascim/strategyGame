//
//  HUD.swift
//  strategyGame
//
//  Created by Wolfgang Walder on 22/10/19.
//  Copyright © 2019 teamStrategyGame. All rights reserved.
//

let healthBarScale = 0.60

import SpriteKit

class HUD: SKShapeNode {
    var upperScrnArea: SKShapeNode
    var gridScreenArea: SKShapeNode
    var lowerScrnArea: SKShapeNode
    var endTurnBtn: EndTurnButton
    var attackBtn: AttackButton
    var spAttackBtn: SpecialAttackButton
    static var playerHealthBarList: [HealthBar] = []
    static var enemyHealthBarList: [HealthBar] = []
    
    init(rect: CGRect) {
        HUD.playerHealthBarList.removeAll()
        HUD.enemyHealthBarList.removeAll()
        
        upperScrnArea = SKShapeNode(rect: CGRect(origin: CGPoint(x: 0, y: 770), size: CGSize(width: 414, height: 140)))
        gridScreenArea = SKShapeNode(rect: CGRect(origin: CGPoint(x: 0, y: 210), size: CGSize(width: 414, height: 560)))
        lowerScrnArea = SKShapeNode(rect: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 414, height: 210)))
        endTurnBtn = EndTurnButton(rect: CGRect(x: 120, y: 50, width: 107*buttonScale, height: 39*buttonScale), text: "End Turn")
        attackBtn = AttackButton(rect: CGRect(x: 15, y: 130, width: 107*buttonScale, height: 39*buttonScale), text: "Attack")
        spAttackBtn = SpecialAttackButton(rect: CGRect(x: 225, y: 130, width: 107*buttonScale, height: 39*buttonScale), text: "Special")
        
        super.init()
        
        self.position = CGPoint(x: rect.minX, y: rect.minY)
        self.path = CGPath(rect: rect, transform: nil)
        
        upperScrnArea.strokeColor = .clear
        gridScreenArea.strokeColor = .clear
        lowerScrnArea.strokeColor = .clear
        
        self.addChild(upperScrnArea)
        self.addChild(gridScreenArea)
        self.addChild(lowerScrnArea)
        self.lowerScrnArea.addChild(endTurnBtn)
        self.lowerScrnArea.addChild(attackBtn)
        self.lowerScrnArea.addChild(spAttackBtn)
        
        Button.hideAttackButtons()
        
        for i in (0..<GameManager.shared.players.count) {
            HUD.playerHealthBarList.append(HealthBar(rect: CGRect(origin: CGPoint(x: 10, y: -33), size: CGSize(width: 39*healthBarScale, height: 39*healthBarScale)), text: "\(GameManager.shared.players[i].health)"))
            
            HUD.playerHealthBarList[i].zPosition = 1.0
            
            GameManager.shared.players[i].addChild(HUD.playerHealthBarList[i])
        }
        
        for i in (0..<GameManager.shared.enemies.count) {
            HUD.enemyHealthBarList.append(HealthBar(rect: CGRect(origin: CGPoint(x: 10, y: -33), size: CGSize(width: 39*healthBarScale, height: 39*healthBarScale)), text: "\(GameManager.shared.enemies[i].health)"))

            HUD.enemyHealthBarList[i].zPosition = 1.0

            GameManager.shared.enemies[i].addChild(HUD.enemyHealthBarList[i])
        }
    }
    
    static func updateHealthBars() {
        for i in (0..<GameManager.shared.players.count) {
            HUD.playerHealthBarList[i].label.text = "\(GameManager.shared.players[i].health)"
        }
        
        for i in (0..<GameManager.shared.enemies.count) {
            HUD.enemyHealthBarList[i].label.text = "\(GameManager.shared.enemies[i].health)"
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
