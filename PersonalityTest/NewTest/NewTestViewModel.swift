//
//  NewTestViewModel.swift
//  PersonalityTest
//
//  Created by Victor Grigoroiu on 21.11.2022.
//

import Foundation

class NewTestViewModel: ObservableObject {
    
    @Published var currentQuestion: UIQuestion = UIQuestion()
    @Published var allQuestionsAnswered: Bool = false
    @Published var showLoading: Bool = false
    @Published var showingErrorAlert: Bool = false
    
    var currentQuestionString: String {
        return "\(currentIndex + 1) / \(questions.count)"
    }
    var personalityType: PersonalityType {
        return scoreCalculator.calculatePersonality(score: score)
    }
    private var score: Int {
        questions.map({$0.selectedAnswer?.score ?? 0}).reduce(0, +)
    }
    
    private var currentIndex = 0
    private var questions: [Question] = []
    private let apiService: ApiService
    private let scoreCalculator: ScoreCalculator
    private let userContext: UserContext
    
    init(apiService: ApiService, scoreCalculator: ScoreCalculator, userContext: UserContext) {
        self.apiService = apiService
        self.scoreCalculator = scoreCalculator
        self.userContext = userContext
    }
    
    func newTest() {
        currentIndex = 0
        questions = []
        currentQuestion = UIQuestion()
        allQuestionsAnswered = false
        showLoading = false
        showingErrorAlert = false
        
        fetchPersonalityTest()
    }
    
    func goToTheNextQuestion() {
        updateCurrentQuestion { [weak self] status in
            guard let self = self else {
                return
            }
            if status {
                self.currentIndex += 1
                
                if self.currentIndex < self.questions.count {
                    self.currentQuestion = self.questions[self.currentIndex].toUIQuestion
                } else {
                    if self.questions.allSatisfy({$0.selectedAnswer != nil}) {
                        self.userContext.user = User(username: self.userContext.user?.username ?? "", personalityType: self.personalityType)
                        self.allQuestionsAnswered = true
                    } else {
                        self.showingErrorAlert = true
                    }
                }
            } else {
                self.showingErrorAlert = true
            }
        }
    }
    
    private func updateCurrentQuestion(completion: @escaping (Bool) -> Void) {
        guard let question = questions.first(where: { $0.id == currentQuestion.id }) else {
            completion(false)
            return
        }
        guard let selectedAnswer = question.answersList.first(where: { $0.id == currentQuestion.answers.first(where: {$0.selected})?.id }) else {
            completion(false)
            return
        }
        
        self.showLoading = true
        apiService.updateQuestion(question: question, answer: selectedAnswer, completion: { [weak self] questions in
            self?.showLoading = false
            
            self?.questions = questions
            self?.userContext.questionsList = questions
            
            completion(true)
        })
    }
    
    private func fetchPersonalityTest() {
        self.showLoading = true
        self.apiService.fetchPersonalityTest { [weak self] questions in
            self?.showLoading = false
            
            self?.questions = questions
            self?.currentQuestion = questions[0].toUIQuestion
            self?.userContext.questionsList = questions
        }
    }
}
