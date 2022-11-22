//
//  AnswerView.swift
//  PersonalityTest
//
//  Created by Victor Grigoroiu on 21.11.2022.
//

import SwiftUI

struct AnswerView: View {
    @Binding var uiAnswer: UIAnswer
    
    var body: some View {
        HStack{
            Image(systemName: uiAnswer.selected ? "checkmark.square.fill" : "square")
                .foregroundColor(uiAnswer.selected ? Color(UIColor.systemBlue) : Color.secondary)
            Text(uiAnswer.title)
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 4)
    }
}

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView(uiAnswer: Binding<UIAnswer>.constant(UIAnswer.init(id: "1", title: "Title", selected: false)))
    }
}
