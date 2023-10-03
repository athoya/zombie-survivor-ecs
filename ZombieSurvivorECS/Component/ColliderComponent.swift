//
//  ColliderComponent.swift
//  ZombieSurvivorECS
//
//  Created by Athoya on 24/08/23.
//

import SpriteKit
import GameplayKit

enum ColliderBitMask: UInt32 {
    case player = 0b1
    case enemy = 0b10
    case attack = 0b100
    case none = 0
}

class ColliderComponent: GKComponent {
    
    let entityManager: EntityManager?
    
    var categoryBitMask: ColliderBitMask
    var contactBitMask: ColliderBitMask
    var collisionBitMask: ColliderBitMask

    init(categoryBitMask: ColliderBitMask, contactBitMask: ColliderBitMask, collisionBitMask: ColliderBitMask, entityManager: EntityManager) {
        self.entityManager = entityManager
        self.categoryBitMask = categoryBitMask
        self.contactBitMask = contactBitMask
        self.collisionBitMask = collisionBitMask
        super.init()
    }
    
    func getPhysicsBody(size: CGSize) -> SKPhysicsBody {
        let physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody.categoryBitMask = categoryBitMask.rawValue
        physicsBody.contactTestBitMask = contactBitMask.rawValue
        physicsBody.collisionBitMask = collisionBitMask.rawValue
        physicsBody.affectedByGravity = false
        return physicsBody
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
    }
}
