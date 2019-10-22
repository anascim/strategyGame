import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var grid: Grid?
    var background: Background?
    var attackButton: AttackButton?
    var specialAttackButton: SpecialAttackButton?
    var endTurnButton: EndTurnButton?
    
    var templateSceneString: String = """
000000\
111111\
228222\
333303\
444444\
555255\
666666\
777077
"""
    var templateSceneString2: String = """
00000\
11111\
22222\
33303\
44444\
55555\
61666\
77777\
88388\
99999\
00030\
11111
"""
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    override func didMove(to view: SKView) {
        AnimationHandler.shared.awake()
        self.background = Background(view: view)
        addChild(background!)
        self.grid = Grid(position: CGPoint(x: 0, y: 700), width: 6, height: 8, tileSize: CGSize(width: 70, height: 70), tileSet: templateSceneString)
        addChild(grid!)
        GameManager.shared.awake(grid: grid!)
        self.attackButton = AttackButton(rect: CGRect(x: 40, y: 100, width: 120, height: 80), text: "Attack")
        addChild(attackButton!)
        self.specialAttackButton = SpecialAttackButton(rect: CGRect(x: 250, y: 100, width: 120, height: 80), text: "Special")
        addChild(specialAttackButton!)
        self.endTurnButton = EndTurnButton(rect: CGRect(x: 145, y: 20, width: 150, height: 80), text: "End Turn")
        addChild(endTurnButton!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch: UITouch = touches.first {
            let location: CGPoint = touch.location(in: self)
            let touchedNodes: [SKNode] = nodes(at: location)
            for node in touchedNodes {
                if let tile: Tile = node as? Tile {
                    GameManager.shared.touchTile(tile: tile)
                    return
                }
                if let button: Button = node as? Button {
                    if button.pressed {
                        button.unpress()
                    } else {
                        button.press()
                    }
                }
            }
        }
    }
}