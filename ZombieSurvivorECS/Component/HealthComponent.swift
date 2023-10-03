//
//  PlayerHealthCompnent.swift
//  ZombieSurvivorECS
//
//  Created by Athoya on 24/08/23.
//


import SpriteKit
import GameplayKit

class HealthComponent: GKComponent {
    
    var health: Int = 0
    
    override init() {
        super.init()
    }
    
    init(initialHealth: Int) {
        self.health = initialHealth
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
    }
    
}
