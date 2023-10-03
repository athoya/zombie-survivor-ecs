//
//  TimerComponent.swift
//  ZombieSurvivorECS
//
//  Created by Athoya on 22/08/23.
//

import SpriteKit
import GameplayKit

class TimerComponent: GKComponent {
    
    var timeElapsed: Double = 0
    var currentTime = TimeInterval(0)
    
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        
        let second = TimeInterval(0.1)
        if CACurrentMediaTime() - currentTime > second {
            timeElapsed += 0.1
            currentTime = CACurrentMediaTime()
        }
    }
}
