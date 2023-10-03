//
//  SpawnerComponent.swift
//  ZombieSurvivorECS
//
//  Created by Athoya on 24/08/23.
//

import SpriteKit
import GameplayKit

class PlayerAttackComponent: GKComponent {
    
    let entityManager: EntityManager?
    
    var attackRate = TimeInterval(1)
    var lastAttackTime = TimeInterval(0)
    var radius: Double = 50

    init(entityManager: EntityManager) {
        self.entityManager = entityManager
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        
        if CACurrentMediaTime() - lastAttackTime > attackRate {
            lastAttackTime = CACurrentMediaTime()
            
            if let point = entity?.component(ofType: SpriteShapeComponent.self) {
                let node = SKShapeNode(circleOfRadius: radius)
                node.position = point.node.position
                
                let physicsBody = SKPhysicsBody(circleOfRadius: radius)
                physicsBody.affectedByGravity = false
                physicsBody.categoryBitMask = ColliderBitMask.attack.rawValue
                physicsBody.contactTestBitMask = ColliderBitMask.enemy.rawValue
                physicsBody.collisionBitMask = ColliderBitMask.none.rawValue
                node.physicsBody = physicsBody
                
                entityManager?.scene.addChild(node)
                let scaleAction = SKAction.scale(by: 3, duration: 1.0)
                let removeAction = SKAction.removeFromParent()
                node.run(SKAction.sequence([scaleAction, removeAction]))
            }
        }
    }
}
