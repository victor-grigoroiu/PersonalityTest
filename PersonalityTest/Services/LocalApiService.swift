//
//  PersonalityTestService.swift
//  PersonalityTest
//
//  Created by Victor Grigoroiu on 21.11.2022.
//

import Foundation

class LocalApiService: ApiService {
    
    private var user = DataSourceFactory.user
    private var questions = DataSourceFactory.questions
    
    func fetchUserData(completion: (User) -> Void) {
        completion(self.user)
    }
    
    func updateUserData(personalityType: PersonalityType, completion: (User) -> Void) {
        self.user = User(username: user.username, personalityType: personalityType)
        completion(self.user)
    }
    
    func fetchPersonalityTest(completion: ([Question]) -> Void) {
        self.questions = DataSourceFactory.questions
        completion(self.questions)
    }
    
    func updateQuestion(question: Question, answer: QuestionAnswer, completion: ([Question]) -> Void) {
        if let index = questions.firstIndex(where: {$0.id == question.id}) {
            self.questions[index] = Question(id: questions[index].id,
                                             title: questions[index].title,
                                             answersList: questions[index].answersList,
                                             selectedAnswer: answer)
        }
        
        completion(self.questions)
    }
}
