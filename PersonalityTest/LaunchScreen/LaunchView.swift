//
//  ContentView.swift
//  PersonalityTest
//
//  Created by Victor Grigoroiu on 21.11.2022.
//

import SwiftUI

struct LaunchView: View {
    @ObservedObject private var viewModel: LaunchViewModel
    
    init(viewModel: LaunchViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.showLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    VStack {
                        HStack {
                            Image(systemName: "person.circle")
                                .imageScale(.large)
                                .foregroundColor(.accentColor)
                            Text("Hello \(viewModel.username)")
                        }
                        .padding()
                        Text("Are you curious to see if you are an introvert or extrovert personality type? Press on \"New Test\" and follow the questions.")
                            .padding()
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, 100)
                    .padding(.bottom, 10)
                    
                    VStack {
                        NavigationLink(destination: NewTestView(viewModel: viewModel.newTestViewModel)
                            .navigationBarTitle("Personality Test")
                            .navigationBarHidden(false)) {
                                Text("New Test")
                                    .bold()
                            }
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 10) {
                        Text("Your last personality test result is")
                        Text("\(viewModel.personalityType)")
                            .font(.title2)
                            .bold()
                    }
                    
                    .padding(.bottom, 80)
                }
            }
            .onAppear {
                self.viewModel.refreshView()
            }
            .navigationViewStyle(.stack)
        }
        .padding()
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(viewModel: LaunchViewModel(apiService: LocalApiService(), userContext: UserContext.shared))
    }
}
