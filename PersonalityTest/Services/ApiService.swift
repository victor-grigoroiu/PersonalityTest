//
//  ApiService.swift
//  PersonalityTest
//
//  Created by Victor Grigoroiu on 21.11.2022.
//

import Foundation

protocol ApiService {
    func fetchUserData(completion: (User) -> Void)
    func updateUserData(personalityType: PersonalityType, completion: (User) -> Void)
    
    func fetchPersonalityTest(completion: ([Question]) -> Void)
    func updateQuestion(question: Question, answer: QuestionAnswer, completion: ([Question]) -> Void)
}
