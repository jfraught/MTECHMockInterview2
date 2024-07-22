//
//  UsersViewModel.swift
//  MockInterviewTwo
//
//  Created by Jordan Fraughton on 7/19/24.
//

import Foundation
import UIKit

class UsersViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var settings: Settings
    
    init(_ settings: Settings = Settings()) {
        if let savedSetting = Settings.loadSettings() {
            self.settings = savedSetting
        } else {
            self.settings = settings
        }
    }
    
    func incrementStep() {
        settings.userCount += 1
    }
    
    func decrementStep() {
        guard settings.userCount > 1 else { return }

        settings.userCount -= 1
    }
    
    @MainActor
    func getUsers() {
        Task {
            do {
                let success = try await NetworkController().getUsers(settings.userCount)
                if success {
                    users = User.users
                }
            } catch {
                print(error)
            }
        }
    }
}
