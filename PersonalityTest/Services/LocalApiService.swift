//
//  PersonalityTestService.swift
//  PersonalityTest
//
//  Created by Victor Grigoroiu on 21.11.2022.
//

import Foundation

class LocalApiService: ApiService {
    
    private var questions = [
        Question(id: "1",
                 title: "Test 1",
                 type: .singleChoice,
                 answersList: [
                    QuestionAnswer(id: "1", title: "Question answer 1", score: 1),
                    QuestionAnswer(id: "2", title: "Question answer 2", score: 1),
                    QuestionAnswer(id: "3", title: "Question answer 3", score: 4),
                    QuestionAnswer(id: "4", title: "Question answer 4", score: 2)
                 ],
                 selectedAnswer: nil),
        Question(id: "2",
                 title: "Test 2",
                 type: .singleChoice,
                 answersList: [
                    QuestionAnswer(id: "1", title: "Question answer 1", score: 1),
                    QuestionAnswer(id: "2", title: "Question answer 2", score: 1),
                    QuestionAnswer(id: "3", title: "Question answer 3", score: 4),
                    QuestionAnswer(id: "4", title: "Question answer 4", score: 2)
                 ],
                 selectedAnswer: nil),
        Question(id: "3",
                 title: "Test 3",
                 type: .singleChoice,
                 answersList: [
                    QuestionAnswer(id: "1", title: "Question answer 1", score: 1),
                    QuestionAnswer(id: "2", title: "Question answer 2", score: 1),
                    QuestionAnswer(id: "3", title: "Question answer 3", score: 4),
                    QuestionAnswer(id: "4", title: "Question answer 4", score: 2)
                 ],
                 selectedAnswer: nil),
        Question(id: "4",
                 title: "Test 4",
                 type: .singleChoice,
                 answersList: [
                    QuestionAnswer(id: "1", title: "Question answer 1", score: 1),
                    QuestionAnswer(id: "2", title: "Question answer 2", score: 1),
                    QuestionAnswer(id: "3", title: "Question answer 3", score: 4),
                    QuestionAnswer(id: "4", title: "Question answer 4", score: 2)
                 ],
                 selectedAnswer: nil),
        Question(id: "5",
                 title: "Test 5",
                 type: .singleChoice,
                 answersList: [
                    QuestionAnswer(id: "1", title: "Question answer 1", score: 1),
                    QuestionAnswer(id: "2", title: "Question answer 2", score: 1),
                    QuestionAnswer(id: "3", title: "Question answer 3", score: 4),
                    QuestionAnswer(id: "4", title: "Question answer 4", score: 2)
                 ],
                 selectedAnswer: nil)
    ]
    
    func fetchData() -> [Question] {
        return questions
    }
    
    func updateQuestion(question: Question, answer: QuestionAnswer) {
        if let index = questions.firstIndex(where: {$0.id == question.id}) {
            questions[index] = Question(id: questions[index].id,
                                        title: questions[index].title,
                                        type: questions[index].type,
                                        answersList: questions[index].answersList,
                                        selectedAnswer: answer)
        }
    }
    
    func getScore() -> Int {
        return questions.map({$0.selectedAnswer?.score ?? 0}).reduce(0, +)
    }
}
