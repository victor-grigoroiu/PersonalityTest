//
//  ScoreCalculatorTests.swift
//  PersonalityTestTests
//
//  Created by Victor Grigoroiu on 21.11.2022.
//

import Foundation
import XCTest
@testable import PersonalityTest

final class ScoreCalculatorTests: XCTestCase {
    
    func testScoreCalculatorExtrovert() {
        let util = ScoreCalculator()
        let result = util.calculatePersonality(score: 33)

        XCTAssertTrue(result == .extrovert)
    }
    
    func testScoreCalculatorIntrovert() {
        let util = ScoreCalculator()
        let result = util.calculatePersonality(score: 2)

        XCTAssertTrue(result == .introvert)
    }
}
