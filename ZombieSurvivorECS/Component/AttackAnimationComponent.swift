//
//  AttackAnimationComponent.swift
//  ZombieSurvivorECS
//
//  Created by Athoya on 24/08/23.
//

import SpriteKit
import GameplayKit

class AttackAnimationComponent: GKComponent {
    
    let entityManager: EntityManager?
    let node: SKShapeNode
    
    init(entityManager: EntityManager, radius: CGFloat) {
        self.entityManager = entityManager
        node = SKShapeNode(circleOfRadius: radius)
        node.fillColor = .blue
        super.init()
    }
    
    func animate(center: CGPoint) {
//        entityManager?.scene.addChild(node)
        let scaleAction = SKAction.scale(by: 3, duration: 1.0)
        let removeAction = SKAction.removeFromParent()
        node.run(SKAction.sequence([scaleAction, removeAction]))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
