//
//  Game.swift
//  Bullseye
//
//  Created by Azat Kaiumov on 17.04.2021.
//

import Foundation

struct Game {
    var score: Int = 0
    var round: Int = 1
    var target: Int = 44
    
    func points(value: Int) -> Int {
        let difference = target - value
        return 100 - abs(difference)
    }
}
