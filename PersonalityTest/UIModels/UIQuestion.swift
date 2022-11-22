//
//  UIQuestion.swift
//  PersonalityTest
//
//  Created by Victor Grigoroiu on 21.11.2022.
//

import Foundation

struct UIQuestion: Identifiable {
    let id: String
    let title: String
    var answers: [UIAnswer]
    var answered: Bool = false
    
    var isValid: Bool {
        !id.isEmpty
    }
    
    init(id: String, title: String, answers: [UIAnswer], answered: Bool) {
        self.id = id
        self.title = title
        self.answers = answers
        self.answered = answered
    }
    
    init() {
        self.id = ""
        self.title = ""
        self.answers = []
        self.answered = false
    }
}

extension Question {
    var toUIQuestion: UIQuestion {
        let uiAnswers = self.answersList.map { questionAnswer in
            return questionAnswer.toUIAnswer
        }
        return UIQuestion(id: self.id, title: self.title, answers: uiAnswers, answered: false)
    }
}
