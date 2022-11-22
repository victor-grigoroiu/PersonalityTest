//
//  Question.swift
//  PersonalityTest
//
//  Created by Victor Grigoroiu on 21.11.2022.
//

import Foundation

struct Question {
    let id: String
    let title: String
    let type: QuestionType
    let answersList: [QuestionAnswer]
    let selectedAnswer: QuestionAnswer?
}
