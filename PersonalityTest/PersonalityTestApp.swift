//
//  PersonalityTestApp.swift
//  PersonalityTest
//
//  Created by Victor Grigoroiu on 21.11.2022.
//

import SwiftUI

@main
struct PersonalityTestApp: App {
    var body: some Scene {
        WindowGroup {
            let apiService = LocalApiService()
            let launchViewModel = LaunchViewModel(apiService: apiService, userContext: UserContext.shared)
            
            LaunchView(viewModel: launchViewModel)
        }
    }
}
