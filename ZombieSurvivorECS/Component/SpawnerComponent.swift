//
//  SpawnerComponent.swift
//  ZombieSurvivorECS
//
//  Created by Athoya on 23/08/23.
//

import SpriteKit
import GameplayKit

class SpawnerComponent: GKComponent {
    
    let entityManager: EntityManager?
    
    var spawnRate = TimeInterval(0.1)
    var lastSpawnTime = TimeInterval(0)
    var spawnPosition: CGPoint?

    init(entityManager: EntityManager) {
        self.entityManager = entityManager
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        
        if CACurrentMediaTime() - lastSpawnTime > spawnRate {
            lastSpawnTime = CACurrentMediaTime()
            entityManager?.spawnEnemy()
        }
    }
}
