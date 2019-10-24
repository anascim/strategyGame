
import SpriteKit

enum ObjectiveType {
    case sun
    case moon
}

class Objective: Element {

    private var hp: Int = 3
    
    init(tile: Tile, type: ObjectiveType) {
        switch type {
        case .sun:
            super.init(name: "Sun", sprite: SKTexture(imageNamed: "00_sun"), tile: tile, qntdTurnStunned: 0)
            let animation = SKAction.animate(with: AnimationHandler.shared.sunFrames, timePerFrame: 1/TimeInterval(12))
            self.run(SKAction.repeatForever(animation))
        case .moon:
            super.init(name: "Moon", sprite: SKTexture(imageNamed: "00_moons"), tile: tile, qntdTurnStunned: 0)
            let animation = SKAction.animate(with: AnimationHandler.shared.moonFrames, timePerFrame: 1/TimeInterval(8))
            self.run(SKAction.repeatForever(animation))
        }
    }
    
    func takeDamage() {
        self.hp -= 1
        if hp == 0 {
            self.destroy()
        }
    }
    
    func destroy() {
        self.removeFromParent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}