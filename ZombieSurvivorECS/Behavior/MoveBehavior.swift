//
//  SeekPlayerBehavior.swift
//  ZombieSurvivorECS
//
//  Created by Athoya on 23/08/23.
//

import GameplayKit

class MoveBehavior: GKBehavior {
    
    init(targetSpeed: Float, seek: GKAgent, avoid: [GKAgent]?) {
        super.init()
        if targetSpeed > 0 {
//            setWeight(0.1, for: GKGoal(toReachTargetSpeed: targetSpeed))
//            setWeight(0.3, for: GKGoal(toWander: 10))
            setWeight(10, for: GKGoal(toSeekAgent: seek))
            
            if let toAvoid = avoid {
                setWeight(1.0, for: GKGoal(toAvoid: toAvoid, maxPredictionTime: 1.0))
            }
        }
    }
    
}
