//
//  NewTestView.swift
//  PersonalityTest
//
//  Created by Victor Grigoroiu on 21.11.2022.
//

import SwiftUI

struct NewTestView: View {
    @ObservedObject private var viewModel: NewTestViewModel
    
    init(viewModel: NewTestViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            if viewModel.showLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            } else {
                if viewModel.allQuestionsAnswered {
                    VStack{
                        HStack {
                            Text("Your personality test result is:")
                            Text(viewModel.personalityType.rawValue)
                                .font(.headline)
                                .bold()
                        }
                        .padding(.vertical, 20)
                        
                        Button(action: {
                            self.viewModel.newTest()
                        }){
                            Text("Repeat the test")
                        }
                    }
                } else {
                    if viewModel.currentQuestion.isValid  {
                        QuestionView(uiQuestion: $viewModel.currentQuestion)
                        HStack {
                            Spacer()
                            Button("Next question", action: {
                                self.viewModel.goToTheNextQuestion()
                            })
                            .disabled(!viewModel.currentQuestion.answered)
                            .padding()
                        }
                        .padding(.bottom, 20)
                        
                        HStack {
                            Text(viewModel.currentQuestionString)
                        }
                        .padding()
                    } else {
                        Text("Issues with personality test data")
                    }
                }
            }
        }
        .onAppear {
            self.viewModel.newTest()
        }
        .alert("An error occured. Try again", isPresented: $viewModel.showingErrorAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

struct NewTestView_Previews: PreviewProvider {
    static var previews: some View {
        NewTestView(viewModel: NewTestViewModel(apiService: LocalApiService(), scoreCalculator: ScoreCalculator(), userContext: UserContext.shared))
    }
}
