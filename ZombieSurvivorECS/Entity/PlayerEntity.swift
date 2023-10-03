//
//  PlayerEntity.swift
//  ZombieSurvivorECS
//
//  Created by Athoya on 22/08/23.
//

import SpriteKit
import GameplayKit

class PlayerEntity: GKEntity {
    
    init(width: CGFloat, height: CGFloat, entityManager: EntityManager) {
        super.init()
        let shapeSpriteComponent = SpriteShapeComponent(width: width, height: height, color: .green)
//        shapeSpriteComponent.node.fillColor = .green
        addComponent(shapeSpriteComponent)
        
        let playerMovementComponent = PlayerMoveComponent(entityManager: entityManager)
        playerMovementComponent.position = shapeSpriteComponent.node.position.toVector_float2()
        addComponent(playerMovementComponent)
        
        let colliderComponent = ColliderComponent(categoryBitMask: .player, contactBitMask: .enemy, collisionBitMask: .none, entityManager: entityManager)
        shapeSpriteComponent.node.physicsBody = colliderComponent.getPhysicsBody(size: shapeSpriteComponent.node.frame.size)
        addComponent(colliderComponent)
                
        let healthComponent = HealthComponent(initialHealth: 10)
        addComponent(healthComponent)
        
        let attackComponent = PlayerAttackComponent(entityManager: entityManager)
        addComponent(attackComponent)
        
//        let attackAnimationComponent = AttackAnimationComponent(entityManager: entityManager, radius: 3)
//        addComponent(attackAnimationComponent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
