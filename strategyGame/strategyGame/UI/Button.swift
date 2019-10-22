import SpriteKit

class Button: SKSpriteNode {
    
    var buttonNormalTex = SKTexture(imageNamed: "ButtonNormal")
    var buttonPressedTex = SKTexture(imageNamed: "ButtonPressed")
    var pressedColor: UIColor = UIColor(hue: 0, saturation: 0.6, brightness: 0.5, alpha: 1)
    public internal(set) var pressed: Bool {
        didSet {
            self.texture = pressed ? buttonPressedTex : buttonNormalTex
            self.label.fontColor = pressed ? .white : .black
        }
    }
    var label: SKLabelNode
    static var buttonList: [Button] = []
    
    init(rect: CGRect, text: String) {
        self.label = SKLabelNode(text: text)
        self.pressed = false
        super.init(texture: buttonNormalTex, color: .white, size: rect.size)
        self.position = CGPoint(x: rect.maxX - rect.width/2, y: rect.maxY - rect.height/2)
        self.label.position = CGPoint.zero
        self.label.fontColor = .black
        self.label.zPosition = 1.0
        addChild(label)
        Button.buttonList.append(self)
    }
    
    deinit {
        for i in (0..<Button.buttonList.count) where self == Button.buttonList[i] {
            Button.buttonList.remove(at: i)
        }
    }
    
    func press() {}
    
    func unpress() {
        self.pressed = false
        GameManager.shared.mode = GameManager.shared.currentCharacter == nil ? .clear : .move
    }
    
    static func unpressAll() {
        for i in (0..<Button.buttonList.count) {
            Button.buttonList[i].pressed = false
        }
        GameManager.shared.mode = GameManager.shared.currentCharacter == nil ? .clear : .move
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}