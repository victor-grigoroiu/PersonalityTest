//
//  LaunchViewModel.swift
//  PersonalityTest
//
//  Created by Victor Grigoroiu on 21.11.2022.
//

import Foundation
import Combine

class LaunchViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var personalityType: String = ""
    @Published var showLoading: Bool = false
    
    var newTestViewModel: NewTestViewModel {
        return NewTestViewModel(apiService: LocalApiService(), scoreCalculator: ScoreCalculator(), userContext: UserContext.shared)
    }
    
    private let apiService: ApiService
    private let userContext: UserContext
    
    init(apiService: ApiService, userContext: UserContext) {
        self.apiService = apiService
        self.userContext = userContext
        
        fetchData()
    }

    func refreshView() {
        self.personalityType = (self.userContext.user?.personalityType ?? .unknown).rawValue
    }
    
    private func fetchData() {
        self.showLoading = true
        self.apiService.fetchUserData(completion: { [weak self] user in
            self?.showLoading = false
            
            self?.username = user.username
            self?.personalityType = user.personalityType.rawValue
            self?.userContext.user = user
        })
    }
}
