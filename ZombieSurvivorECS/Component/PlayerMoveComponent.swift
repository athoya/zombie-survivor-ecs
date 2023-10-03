//
//  MoveComponent.swift
//  ZombieSurvivorECS
//
//  Created by Athoya on 23/08/23.
//

import SpriteKit
import GameplayKit

class PlayerMoveComponent: GKAgent2D, GKAgentDelegate {
    
    let entityManager: EntityManager?
    
    init(entityManager: EntityManager) {
        self.entityManager = entityManager
        super.init()
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
//        behavior = MoveBehavior(targetSpeed: 1.0, seek: <#T##GKAgent#>, avoid: <#T##[GKAgent]?#>)
        super.update(deltaTime: seconds)
    }
}
