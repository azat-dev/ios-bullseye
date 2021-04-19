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
        let difference = abs(target - value)
        
        var bonusPoints = 0
        
        if difference == 0 {
            bonusPoints = 100
        } else if difference == 1 {
            bonusPoints = 50
        }
        
        return 100 - difference + bonusPoints
    }
    
    mutating func startNewRound(points: Int) {
        round += 1
        score += points
        target = Int.random(in: 1...100)
    }
}
