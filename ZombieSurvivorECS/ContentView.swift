//
//  ContentView.swift
//  ZombieSurvivorECS
//
//  Created by Athoya on 22/08/23.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    var body: some View {
        SpriteView(scene: GameScene(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)), debugOptions: [.showsFPS, .showsNodeCount, .showsPhysics]).ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
