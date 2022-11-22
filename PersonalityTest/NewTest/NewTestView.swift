//
//  NewTestView.swift
//  PersonalityTest
//
//  Created by Victor Grigoroiu on 21.11.2022.
//

import SwiftUI

struct NewTestView: View {
    @State var uiQuestion: UIQuestion
    @State var answered: Bool
    
    var body: some View {
        VStack {
            if answered {
                HStack {
                    Text("Your personality test result is:")
                    Text("Introvert")
                        .font(.headline)
                        .bold()
                }
            } else {
                QuestionView(uiQuestion: $uiQuestion)
                HStack {
                    Spacer()
                    Button("Next question", action: {
                        
                    })
                    .disabled(!uiQuestion.answered)
                    .padding()
                }
                .padding(.bottom, 20)
                
                HStack {
                    Text("1 / 5")
                }
                .padding()
            }
        }
    }
}

struct NewTestView_Previews: PreviewProvider {
    static var previews: some View {
        let uiQuestion = UIQuestion(id: "1", title: "This is a random question", answers: [
            UIAnswer(id: "1", title: "Question answer 1", selected: false),
            UIAnswer(id: "2", title: "Question answer 2", selected: false),
            UIAnswer(id: "3", title: "Question answer 3", selected: false),
            UIAnswer(id: "4", title: "Question answer 4", selected: false)
        ], answered: false)
        
        NewTestView(uiQuestion: uiQuestion, answered: true)
    }
}
