//
//  SpriteShapeComponent.swift
//  ZombieSurvivorECS
//
//  Created by Athoya on 22/08/23.
//

import SpriteKit
import GameplayKit

class SpriteShapeComponent: GKSKNodeComponent {
    
//    let node: SKShapeNode
    
    init(width: CGFloat, height: CGFloat, color: UIColor) {
        super.init()
        let newNode = SKShapeNode(rectOf: CGSize(width: width, height: height))
        newNode.fillColor = color
        node = newNode
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
