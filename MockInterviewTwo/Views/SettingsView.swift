//
//  SettingsView.swift
//  MockInterviewTwo
//
//  Created by Jordan Fraughton on 7/19/24.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var usersViewModel: UsersViewModel
    
    var body: some View {
        Form {
            HStack {
                Text("User Count")
                Spacer()
                Text(String(usersViewModel.settings.userCount))
                Stepper { } onIncrement: {
                    usersViewModel.incrementStep()
                } onDecrement: {
                    usersViewModel.decrementStep()
                }
                .fixedSize()
            }
            
            Group {
                Toggle("Gender", isOn: $usersViewModel.settings.showGender)
                
                Toggle("Location", isOn: $usersViewModel.settings.showLocation)
                
                Toggle("Email", isOn: $usersViewModel.settings.showEmail)
                
                Toggle("Login", isOn: $usersViewModel.settings.showLogin)
                
                Toggle("Registered", isOn: $usersViewModel.settings.showRegistered)
                
                Toggle("Date of birth", isOn: $usersViewModel.settings.showDOB)
                
                Toggle("Phone", isOn: $usersViewModel.settings.showPhone)
                
                Toggle("Cell", isOn: $usersViewModel.settings.showCell)
                
                Toggle("ID", isOn: $usersViewModel.settings.showID)
                
                Toggle("Nationality", isOn: $usersViewModel.settings.showNationality)
            }
        }
        .onChange(of: usersViewModel.settings) {
            Settings.saveSetting(usersViewModel.settings)
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SettingsView(usersViewModel: UsersViewModel())
}
