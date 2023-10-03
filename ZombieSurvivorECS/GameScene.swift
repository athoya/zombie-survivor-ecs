//
//  GameScene.swift
//  ZombieSurvivorECS
//
//  Created by Athoya on 22/08/23.
//

import Foundation
import SpriteKit

class GameScene: SKScene {
    
    var entityManager: EntityManager!
    var lastUpdateTimeInterval = TimeInterval(0)
    
    var timerLabel = SKLabelNode(text: "")
    let spawnInterval = TimeInterval(0.5)
    
    override func didMove(to view: SKView) {
        entityManager = EntityManager(scene: self)
        
        let player = PlayerEntity(width: 50, height: 50, entityManager: entityManager)
        if let playerComponent = player.component(ofType: SpriteShapeComponent.self) {
            playerComponent.node.position = CGPoint(x: size.width / 2, y: size.height / 2)
        }
        entityManager.add(player)
        
        let timer = TimerEntity()
        entityManager.add(timer)
        
        timerLabel.position = CGPoint(x: size.width / 2, y: 100)
        addChild(timerLabel)
        
        let spawnerEntity = SpawnerEntity(entityManager: entityManager)
        entityManager.add(spawnerEntity)
        
        physicsWorld.contactDelegate = self
    }
    
    override func update(_ currentTime: TimeInterval) {
        let deltaTime = currentTime - lastUpdateTimeInterval
        lastUpdateTimeInterval = currentTime

        entityManager.update(deltaTime)
        
        if let timer = entityManager.timerEntity()?.component(ofType: TimerComponent.self) {
            timerLabel.text = "\(timer.timeElapsed.formatted())"
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        let location = touch.location(in: self)
        
        if let shapeComponent = entityManager.playerEntity()?.component(ofType: SpriteShapeComponent.self) {
            shapeComponent.node.position = location
            print(shapeComponent.node.position)
        }
    }
}

extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        var bodyA = contact.bodyA
        var bodyB = contact.bodyB
        if bodyA.categoryBitMask > bodyB.categoryBitMask {
            bodyA = contact.bodyB
            bodyB = contact.bodyA
        }
        
        if bodyA.categoryBitMask == ColliderBitMask.player.rawValue && bodyB.categoryBitMask == ColliderBitMask.enemy.rawValue {
            if let playerHealth = entityManager.playerEntity()?.component(ofType: HealthComponent.self) {
                playerHealth.health -= 1
                print("\(playerHealth.health)")
            }
        }
        
        if bodyA.categoryBitMask == ColliderBitMask.enemy.rawValue && bodyB.categoryBitMask == ColliderBitMask.attack.rawValue {
            if let entity = bodyA.node?.entity {
                entityManager.remove(entity)
            }
        }
    }
}
