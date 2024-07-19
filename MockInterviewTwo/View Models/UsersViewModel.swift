//
//  UsersViewModel.swift
//  MockInterviewTwo
//
//  Created by Jordan Fraughton on 7/19/24.
//

import Foundation

class UsersViewModel: ObservableObject {
    @Published var userCount: Int = 1
    @Published var displayGender = false
    @Published var displayLocation = false
    @Published var displayEmail = false
    @Published var displayLogin = false
    @Published var displayRegistered = false
    @Published var displayDOB = false
    @Published var displayPhone = false
    @Published var displayCell = false
    @Published var displayID = false
    @Published var displayNationality = false
    
    func incrementStep() {
        userCount += 1
    }
    
    func decrementStep() {
        guard userCount > 0 else { return }

        userCount -= 1
    }
}
