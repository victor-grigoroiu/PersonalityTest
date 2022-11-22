//
//  QuestionView.swift
//  PersonalityTest
//
//  Created by Victor Grigoroiu on 21.11.2022.
//

import SwiftUI

struct QuestionView: View {
    @Binding var uiQuestion: UIQuestion
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(uiQuestion.title)
                .font(.title)
                .padding(.horizontal, 20)
            ForEach($uiQuestion.answers, id: \.self) { uiAnswer in
                AnswerView(uiAnswer: uiAnswer).onTapGesture {
                    for index in 0..<uiQuestion.answers.count {
                        uiQuestion.answers[index].selected = !uiQuestion.answers[index].selected && (uiQuestion.answers[index].id == uiAnswer.id)
                    }
                    uiQuestion.answered = !uiQuestion.answers.filter({$0.selected}).isEmpty
                }
            }
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        let uiQuestion = UIQuestion(id: "1", title: "This is a random question", answers: [
            UIAnswer(id: "1", title: "Question answer 1", selected: false),
            UIAnswer(id: "2", title: "Question answer 2", selected: false),
            UIAnswer(id: "3", title: "Question answer 3", selected: false),
            UIAnswer(id: "4", title: "Question answer 4", selected: false)
        ], answered: false)
        QuestionView(uiQuestion: Binding<UIQuestion>.constant(uiQuestion))
    }
}
