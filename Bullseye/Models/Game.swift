//
//  Game.swift
//  Bullseye
//
//  Created by Azat Kaiumov on 17.04.2021.
//

import Foundation

struct LeaderboardEntry {
    let date: Date
    let score: Int
}

struct Game {
    var score = 0
    var round  = 1
    var target = Int.random(in: 1...100)
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool) {
        if (!loadTestData) {
            return
        }
        
        for _ in 0..<100 {
            startNewRound(points: Int.random(in: 0..<200))
        }
    }
    
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
    
    mutating func addToLeaderBoard(points: Int) {
        leaderboardEntries.append(
            LeaderboardEntry(date: Date(), score: points)
        )
        leaderboardEntries.sort { $0.score > $1.score }
    }
    
    mutating func startNewRound(points: Int) {
        round += 1
        score += points
        target = Int.random(in: 1...100)
        addToLeaderBoard(points: points)
    }
    
    mutating func restart() {
        round = 1
        score = 0
        target = Int.random(in: 1...100)
    }
}
