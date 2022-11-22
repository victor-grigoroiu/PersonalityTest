//
//  NewTestViewModelTests.swift
//  PersonalityTestTests
//
//  Created by Victor Grigoroiu on 21.11.2022.
//

import Foundation
import Combine
import XCTest
@testable import PersonalityTest

final class NewTestViewModelTests: XCTestCase {
    /// Note: Usually we should mock this
    private let apiService = LocalApiService()
    private let scoreCalculator = ScoreCalculator()
    
    private var combineBag: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        
        combineBag = []
    }
    
    func testLoadingQuestions() {
        let vm = NewTestViewModel(apiService: apiService, scoreCalculator: scoreCalculator, userContext: UserContext.shared)
        let expectation = XCTestExpectation(description: "testLoadingQuestions")
        
        vm.newTest()
        
        vm.$currentQuestion
            .sink { value in
                XCTAssertTrue(value.id == "1")
                XCTAssertTrue(vm.currentQuestionString == "1 / 5")
                expectation.fulfill()
            }
            .store(in: &combineBag)
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testAnswerForFirstQuestion() {
        let vm = NewTestViewModel(apiService: apiService, scoreCalculator: scoreCalculator, userContext: UserContext.shared)
        let expectation = XCTestExpectation(description: "testAnswerForFirstQuestion")

        vm.newTest()

        vm.$showLoading
            .sink { value in
                vm.currentQuestion.answers = vm.currentQuestion.answers.map({ uiAnswer in
                    if uiAnswer.id == "1" {
                        return UIAnswer(id: uiAnswer.id, title: uiAnswer.title, selected: true)
                    } else {
                        return uiAnswer
                    }
                })
                
                expectation.fulfill()
            }
            .store(in: &combineBag)

        wait(for: [expectation], timeout: 1)
        
        vm.goToTheNextQuestion()
        
        XCTAssertTrue(vm.currentQuestionString == "2 / 5")
        XCTAssertTrue(vm.currentQuestion.id == "2")
    }
}
