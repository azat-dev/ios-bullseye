//
//  Game.swift
//  Bullseye
//
//  Created by Azat Kaiumov on 17.04.2021.
//

import Foundation

struct Game {
    var score = 0
    var round  = 1
    var target = Int.random(in: 1...100)
    
    func points(value: Int) -> Int {
        100 - abs(target - value)
    }
}
