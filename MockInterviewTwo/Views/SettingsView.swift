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
                Text(String(usersViewModel.userCount))
                Stepper { } onIncrement: {
                    usersViewModel.incrementStep()
                } onDecrement: {
                    usersViewModel.decrementStep()
                }
                .fixedSize()
            }
            
            Group {
                Toggle("Gender", isOn: $usersViewModel.displayGender)
                
                Toggle("Location", isOn: $usersViewModel.displayLocation)
                
                Toggle("Email", isOn: $usersViewModel.displayEmail)
                
                Toggle("Login", isOn: $usersViewModel.displayLogin)
                
                Toggle("Registered", isOn: $usersViewModel.displayRegistered)
                
                Toggle("Date of birth", isOn: $usersViewModel.displayDOB)
                
                Toggle("Phone", isOn: $usersViewModel.displayPhone)
                
                Toggle("Cell", isOn: $usersViewModel.displayCell)
                
                Toggle("ID", isOn: $usersViewModel.displayID)
                
                Toggle("Nationality", isOn: $usersViewModel.displayNationality)
            }
            
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    SettingsView(usersViewModel: UsersViewModel())
}
