//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Azat Kaiumov on 17.04.2021.
//
import XCTest

@testable import Bullseye

class BullseyeTests: XCTestCase {
    
    var game: Game!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        game = Game()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        game = nil
    }
    
    func testScorePositive() throws {
        let guess = game.target + 5
        let points = game.points(value: guess)
        XCTAssertEqual(points, 95)
    }
    
    func testScoreNegative() throws {
        let guess = game.target - 5
        let points = game.points(value: guess)
        XCTAssertEqual(points, 95)
    }
    
    func testScoreExact() throws {
        let guess = game.target
        let points = game.points(value: guess)
        XCTAssertEqual(points, 100 + 100)
    }
    
    func testScoreWithoutOne() throws {
        let guess = game.target > 0 ? game.target - 1 : game.target + 1
        let points = game.points(value: guess)
        XCTAssertEqual(points, 99 + 50)
    }
    
    func testStartNewRound() throws {
        XCTAssertEqual(game.score, 0)
        XCTAssertEqual(game.round, 1)
        
        game.startNewRound(points: 100)
        
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 2)
        
        game.startNewRound(points: 50)
        
        XCTAssertEqual(game.score, 150)
        XCTAssertEqual(game.round, 3)
        
    }
}
