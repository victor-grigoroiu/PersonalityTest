//
//  ApiService.swift
//  PersonalityTest
//
//  Created by Victor Grigoroiu on 21.11.2022.
//

import Foundation

protocol ApiService {
    func fetchData() -> [Question]
    func updateQuestion(question: Question, answer: QuestionAnswer)
    func getScore() -> Int
}
