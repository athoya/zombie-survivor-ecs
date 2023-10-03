//
//  EntityManager.swift
//  ZombieSurvivorECS
//
//  Created by Athoya on 22/08/23.
//

import Foundation
import SpriteKit
import GameplayKit

class EntityManager {
    
    let scene: SKScene
    var entities = Set<GKEntity>()
    var toRemove = Set<GKEntity>()
    
    lazy var componentSystems: [GKComponentSystem] = {
        let timerSystem = GKComponentSystem(componentClass: TimerComponent.self)
        let spawnerSystem = GKComponentSystem(componentClass: SpawnerComponent.self)
        let enemyMovementSystem = GKComponentSystem(componentClass: EnemyMoveComponent.self)
        let playerMovementSystem = GKComponentSystem(componentClass: PlayerMoveComponent.self)
        let playerAttackSystem = GKComponentSystem(componentClass: PlayerAttackComponent.self)
        return [timerSystem, spawnerSystem, enemyMovementSystem, playerMovementSystem, playerAttackSystem]
    }()
    
    init(scene: SKScene) {
        self.scene = scene
    }
    
    func add(_ entity: GKEntity) {
        entities.insert(entity)
        
        if let spriteNode = entity.component(ofType: SpriteShapeComponent.self)?.node {
            scene.addChild(spriteNode)
        }
        
        for componentSystem in componentSystems {
          componentSystem.addComponent(foundIn: entity)
        }
    }
    
    func remove(_ entity: GKEntity) {
        if let spriteNode = entity.component(ofType: SpriteShapeComponent.self)?.node {
            spriteNode.removeFromParent()
        }
        
//        entities.remove(entity)
        toRemove.insert(entity)
    }
    
    func update(_ deltaTime: CFTimeInterval) {
        for componentSystem in componentSystems {
            componentSystem.update(deltaTime: deltaTime)
        }
        
        for currentRemove in toRemove {
            for componentSystem in componentSystems {
              componentSystem.removeComponent(foundIn: currentRemove)
            }
        }
        toRemove.removeAll()
    }
    
    func timerEntity() -> GKEntity? {
        for entity in entities {
            if entity.component(ofType: TimerComponent.self) != nil {
                return entity
            }
        }
        return nil
    }
    
    func playerEntity() -> GKEntity? {
        for entity in entities {
            if entity.component(ofType: PlayerMoveComponent.self) != nil {
                return entity
            }
        }
        return nil
    }
    
    func enemyEntities() -> [GKEntity] {
        return entities.filter{ $0.self is EnemyEntity }
    }
    
    func spawnEnemy() {
        let enemy = EnemyEntity(width: 20, height: 20, entityManager: self)
        if let spriteComponent = enemy.component(ofType: SpriteShapeComponent.self) {
            let randomPos = Int.random(in: 1...4)
            var xPos: CGFloat = 0
            var yPos: CGFloat = 0
            if randomPos == 1 {
                xPos = CGFloat.random(in: (scene.size.width)...(scene.size.width))
                yPos = scene.size.height
            }
            if randomPos == 2 {
                xPos = CGFloat.random(in: (scene.size.width)...(scene.size.width))
                yPos = -scene.size.height
            }
            if randomPos == 3 {
                xPos = scene.size.width
                yPos = CGFloat.random(in: (scene.size.height)...(scene.size.height))
            }
            
            if randomPos == 4 {
                xPos = -scene.size.width
                yPos = CGFloat.random(in: (scene.size.height)...(scene.size.height))
            }
            spriteComponent.node.position = CGPoint(x: xPos, y: yPos)
            spriteComponent.node.zPosition = 2
        }
        add(enemy)
    }
}
