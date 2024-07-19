//
//  UsersView.swift
//  MockInterviewTwo
//
//  Created by Jordan Fraughton on 7/19/24.
//

import SwiftUI

struct UsersView: View {
    @StateObject var usersViewModel = UsersViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                
            }
            .navigationTitle("Random Users")
            .toolbar {
                ToolbarItem(placement: .primaryAction){
                    NavigationLink {
                        SettingsView(usersViewModel: usersViewModel)
                    } label: {
                        Label("Settings", systemImage: "gear")
                    }
                }
            }
        }
    }
}

#Preview {
    UsersView()
}
