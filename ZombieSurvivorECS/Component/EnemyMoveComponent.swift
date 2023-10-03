//
//  MoveComponent.swift
//  ZombieSurvivorECS
//
//  Created by Athoya on 23/08/23.
//

import SpriteKit
import GameplayKit

class EnemyMoveComponent: GKAgent2D, GKAgentDelegate {
    
    let entityManager: EntityManager?
    
    init(maxSpeed: Float, maxAcceleration: Float, radius: Float, entityManager: EntityManager) {
        self.entityManager = entityManager
        super.init()
        self.maxSpeed = maxSpeed
        self.maxAcceleration = maxAcceleration
        self.radius = radius
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func agentWillUpdate(_ agent: GKAgent) {
        guard let spriteComponent = entity?.component(ofType: SpriteShapeComponent.self) else {
            return
        }
        
        position = spriteComponent.node.position.toVector_float2()
    }
    
    func agentDidUpdate(_ agent: GKAgent) {
        guard let spriteComponent = entity?.component(ofType: SpriteShapeComponent.self) else {
            return
        }
        
        spriteComponent.node.position = position.toCGPoint()
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        if let playerAgent = entityManager?.playerEntity()?.component(ofType: PlayerMoveComponent.self) {
            behavior?.removeAllGoals()
            behavior = MoveBehavior(targetSpeed: 10, seek: playerAgent, avoid: nil)
        }
        super.update(deltaTime: seconds)
    }
}
