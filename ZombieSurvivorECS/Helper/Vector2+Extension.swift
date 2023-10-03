//
//  Vector2+Extension.swift
//  ZombieSurvivorECS
//
//  Created by Athoya on 23/08/23.
//

import Foundation
import GameplayKit

extension vector_float2 {
    func toCGPoint() -> CGPoint {
        return CGPoint(x: Double(self.x), y: Double(self.y))
    }
}
