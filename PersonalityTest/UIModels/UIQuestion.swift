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
    var answered: Bool
}
