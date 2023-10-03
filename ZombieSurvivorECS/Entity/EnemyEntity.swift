//
//  EnemyEntity.swift
//  ZombieSurvivorECS
//
//  Created by Athoya on 22/08/23.
//
import SpriteKit
import GameplayKit

class EnemyEntity: GKEntity {
    
    init(width: CGFloat, height: CGFloat, entityManager: EntityManager) {
        super.init()
        let shapeSpriteComponent = SpriteShapeComponent(width: width, height: height, color: .red)
//        shapeSpriteComponent.node.fillColor = .red
        addComponent(shapeSpriteComponent)
        
        let enemyMovementComponent = EnemyMoveComponent(maxSpeed: 1000, maxAcceleration: 1000, radius: 1, entityManager: entityManager)
        addComponent(enemyMovementComponent)
        
        let colliderComponent = ColliderComponent(categoryBitMask: .enemy, contactBitMask: .player, collisionBitMask: .none, entityManager: entityManager)
        shapeSpriteComponent.node.physicsBody = colliderComponent.getPhysicsBody(size: shapeSpriteComponent.node.frame.size)
        addComponent(colliderComponent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
