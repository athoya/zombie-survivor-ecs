//
//  SpawnerEntity.swift
//  ZombieSurvivorECS
//
//  Created by Athoya on 23/08/23.
//

import SpriteKit
import GameplayKit

class SpawnerEntity: GKEntity {
    
    init(entityManager: EntityManager) {
        super.init()
        let spawnerComponent = SpawnerComponent(entityManager: entityManager)
        addComponent(spawnerComponent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        
    }
}

