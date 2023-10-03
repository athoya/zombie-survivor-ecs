//
//  TimerEntity.swift
//  ZombieSurvivorECS
//
//  Created by Athoya on 22/08/23.
//

import SpriteKit
import GameplayKit

class TimerEntity: GKEntity {
    
    override init() {
        super.init()
        let timerComponent = TimerComponent()
        addComponent(timerComponent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        
    }
}
