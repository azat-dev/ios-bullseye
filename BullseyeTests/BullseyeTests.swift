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
        var guess = game.target + 5
        var points = game.points(value: guess)
        XCTAssertEqual(points, 95)
    }
    
    func testScoreNegative() throws {
        var guess = game.target - 5
        var points = game.points(value: guess)
        XCTAssertEqual(points, 95)
    }
}
