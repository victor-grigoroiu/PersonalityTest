//
//  DataSourceFactory.swift
//  PersonalityTest
//
//  Created by Victor Grigoroiu on 22.11.2022.
//

import Foundation

class DataSourceFactory {
    static let user = User(username: "User", personalityType: .unknown)
    static let questions = [
        Question(id: "1",
                 title: "Personality question 1",
                 answersList: [
                    QuestionAnswer(id: "1", title: "Question answer 1", score: 2),
                    QuestionAnswer(id: "2", title: "Question answer 2", score: 1),
                    QuestionAnswer(id: "3", title: "Question answer 3", score: 4),
                    QuestionAnswer(id: "4", title: "Question answer 4", score: 2)
                 ],
                 selectedAnswer: nil),
        Question(id: "2",
                 title: "Personality question 2",
                 answersList: [
                    QuestionAnswer(id: "1", title: "Question answer 1", score: 1),
                    QuestionAnswer(id: "2", title: "Question answer 2", score: 1),
                    QuestionAnswer(id: "3", title: "Question answer 3", score: 4),
                    QuestionAnswer(id: "4", title: "Question answer 4", score: 2)
                 ],
                 selectedAnswer: nil),
        Question(id: "3",
                 title: "Personality question 3",
                 answersList: [
                    QuestionAnswer(id: "1", title: "Question answer 1", score: 1),
                    QuestionAnswer(id: "2", title: "Question answer 2", score: 1),
                    QuestionAnswer(id: "3", title: "Question answer 3", score: 4),
                    QuestionAnswer(id: "4", title: "Question answer 4", score: 2)
                 ],
                 selectedAnswer: nil),
        Question(id: "4",
                 title: "Personality question 4",
                 answersList: [
                    QuestionAnswer(id: "1", title: "Question answer 1", score: 1),
                    QuestionAnswer(id: "2", title: "Question answer 2", score: 1),
                    QuestionAnswer(id: "3", title: "Question answer 3", score: 4),
                    QuestionAnswer(id: "4", title: "Question answer 4", score: 7)
                 ],
                 selectedAnswer: nil),
        Question(id: "5",
                 title: "Personality question 5",
                 answersList: [
                    QuestionAnswer(id: "1", title: "Question answer 1", score: 3),
                    QuestionAnswer(id: "2", title: "Question answer 2", score: 1),
                    QuestionAnswer(id: "3", title: "Question answer 3", score: 6),
                    QuestionAnswer(id: "4", title: "Question answer 4", score: 2)
                 ],
                 selectedAnswer: nil)
    ]
}
