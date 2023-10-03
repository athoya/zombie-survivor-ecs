//
//  CGPoint+Extention.swift
//  ZombieSurvivorECS
//
//  Created by Athoya on 23/08/23.
//

import Foundation
import GameplayKit

extension CGPoint {
    func toVector_float2() -> vector_float2 {
        return vector_float2(x: Float(self.x), y: Float(self.y))
    }
}
