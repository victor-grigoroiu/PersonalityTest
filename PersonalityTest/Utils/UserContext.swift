//
//  UserContext.swift
//  PersonalityTest
//
//  Created by Victor Grigoroiu on 21.11.2022.
//

import Foundation

class UserContext {
    static let shared = UserContext()
        
    var user: User? = nil
    var questionsList: [Question] = []
    
    private init() {}
}
