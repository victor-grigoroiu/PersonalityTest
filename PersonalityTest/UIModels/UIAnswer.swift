//
//  UIAnswer.swift
//  PersonalityTest
//
//  Created by Victor Grigoroiu on 21.11.2022.
//

import Foundation

struct UIAnswer: Identifiable, Hashable {
    let id: String
    let title: String
    var selected: Bool
}

extension QuestionAnswer {
    var toUIAnswer: UIAnswer {
        return UIAnswer(id: self.id, title: self.title, selected: false)
    }
}
