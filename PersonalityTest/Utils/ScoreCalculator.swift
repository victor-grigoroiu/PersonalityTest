//
//  File.swift
//  PersonalityTest
//
//  Created by Victor Grigoroiu on 21.11.2022.
//

import Foundation

class ScoreCalculator {
    private static let introvertThreshold = 10
    
    func calculatePersonality(score: Int) -> PersonalityType {
        if score > ScoreCalculator.introvertThreshold {
            return .extrovert
        }
        
        return .introvert
    }
}
