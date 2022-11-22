//
//  ContentView.swift
//  PersonalityTest
//
//  Created by Victor Grigoroiu on 21.11.2022.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Are you an introvert or an extrovert?")
                }
                .padding(.top, 100)
                .padding(.bottom, 40)
                
                HStack {
                    Text("Your lat personality test result is:")
                    Text("Introvert")
                        .bold()
                }
                Spacer()
                
                VStack {
                    let uiQuestion = UIQuestion(id: "1", title: "This is a random question", answers: [
                        UIAnswer(id: "1", title: "Question answer 1", selected: false),
                        UIAnswer(id: "2", title: "Question answer 2", selected: false),
                        UIAnswer(id: "3", title: "Question answer 3", selected: false),
                        UIAnswer(id: "4", title: "Question answer 4", selected: false)
                    ], answered: false)
                    
                    NavigationLink(destination: NewTestView(uiQuestion: uiQuestion, answered: false)
                                    .navigationBarTitle("Personality Test")
                                    .navigationBarHidden(false)) {
                        Text("New Test")
                    }
                }
                .padding(.bottom, 50)
            }
            .navigationViewStyle(.stack)
        }
        .padding()
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
