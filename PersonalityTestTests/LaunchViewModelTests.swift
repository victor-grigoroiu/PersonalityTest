//
//  LaunchViewModelTest.swift
//  PersonalityTestTests
//
//  Created by Victor Grigoroiu on 21.11.2022.
//

import Foundation
import Combine
import XCTest
@testable import PersonalityTest

final class LaunchViewModelTests: XCTestCase {
    
    /// Note: Usually we should mock this
    private let apiService = LocalApiService()
    private var combineBag: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        
        combineBag = []
    }
    
    func testUserName() {
        let vm = LaunchViewModel(apiService: apiService, userContext: UserContext.shared)
        let expectation = XCTestExpectation(description: "testUserName")
        
        vm.$username
            .dropFirst()
            .sink { value in
                XCTAssertTrue(value == "User")
                expectation.fulfill()
            }
            .store(in: &combineBag)
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testPersonalityType() {
        let vm = LaunchViewModel(apiService: apiService, userContext: UserContext.shared)
        let expectation = XCTestExpectation(description: "testPersonalityType")
        
        vm.$personalityType
            .dropFirst()
            .sink { value in
                XCTAssertTrue(value == "Unknown")
                expectation.fulfill()
            }
            .store(in: &combineBag)
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testRefreshView() {
        let vm = LaunchViewModel(apiService: apiService, userContext: UserContext.shared)
        
        let expectation = XCTestExpectation(description: "testRefreshView")
        
        vm.$username
            .dropFirst()
            .sink { value in
                UserContext.shared.user = User.init(username: "User", personalityType: .introvert)
                vm.refreshView()
                
                XCTAssertTrue(vm.personalityType == "Introvert")
                expectation.fulfill()
            }
            .store(in: &combineBag)
        
        wait(for: [expectation], timeout: 1)
    }
}
