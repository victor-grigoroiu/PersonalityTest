//
//  LocalApiServiceTests.swift
//  PersonalityTestTests
//
//  Created by Victor Grigoroiu on 21.11.2022.
//

import Foundation
import XCTest
@testable import PersonalityTest

final class LocalApiServiceTests: XCTestCase {
    private let apiService = LocalApiService()
    
    func testFetchUser() {
        apiService.fetchUserData(completion: { result in
            XCTAssertEqual(result.username, "User")
            XCTAssertEqual(result.personalityType, PersonalityType.unknown)
        })
    }
    
    func testUpdateUser() {
        apiService.updateUserData(personalityType: .introvert, completion: { result in
            XCTAssertEqual(result.username, "User")
            XCTAssertEqual(result.personalityType, PersonalityType.introvert)
        })
    }
    
    func testFetchPersonalityTest() {
        apiService.fetchPersonalityTest { result in
            let isNewTest = result.allSatisfy { question in
                question.selectedAnswer == nil
            }
            
            XCTAssertEqual(result.count, 5)
            XCTAssertTrue(isNewTest)
        }
    }
    
    func testUpdateQuestion() {
        apiService.fetchPersonalityTest(completion: { [weak self] questions in
            guard let self = self else { return }
            
            let selectedQuestion = questions[1]
            let selectedAnswer = selectedQuestion.answersList[1]

            self.apiService.updateQuestion(question: selectedQuestion, answer: selectedAnswer, completion: { result in
                XCTAssertEqual(result.count, 5)
                XCTAssertTrue(result[1].selectedAnswer?.id == selectedQuestion.answersList[1].id)
            })
        })
        
    }
}
