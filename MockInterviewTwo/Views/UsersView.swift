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
                if User.users.isEmpty {
                    ProgressView()
                } else {
                    ForEach(usersViewModel.users, id: \.login.uuid) { user in
                        Section {
                            UserImageView(userImageViewModel: UserImageViewModel(user: user))
                            
                            HStack {
                                Text("Name")
                                Spacer()
                                Text("\(user.name.first) \(user.name.last)")
                            }

                            if usersViewModel.settings.showGender {
                                HStack {
                                    Text("Gender")
                                    Spacer()
                                    Text(user.gender)
                                }
                            }
                           
                            if usersViewModel.settings.showLocation {
                                HStack {
                                    Text("Location")
                                    Spacer()
                                    Text(user.location.description)
                                }
                            }
                           
                            if usersViewModel.settings.showEmail {
                                HStack {
                                    Text("Email")
                                    Spacer()
                                    Text(user.email)
                                }
                            }
                            
                            if usersViewModel.settings.showLogin {
                                HStack {
                                    Text("Login")
                                    Spacer()
                                    Text(user.login.username)
                                }
                            }
                            
                            if usersViewModel.settings.showRegistered {
                                HStack {
                                    Text("Registered")
                                    Spacer()
                                    Text(user.registered.date, format: .dateTime.day().month().year())
                                }
                            }
                            
                            if usersViewModel.settings.showDOB {
                                HStack {
                                    Text("Date of birth")
                                    Spacer()
                                    Text(user.dob.date, format: .dateTime.day().month().year())
                                }
                            }
                            
                            if usersViewModel.settings.showPhone {
                                HStack {
                                    Text("Phone")
                                    Spacer()
                                    Text(user.phone)
                                }
                            }
                            
                            if usersViewModel.settings.showCell {
                                HStack {
                                    Text("Cell")
                                    Spacer()
                                    Text(user.cell)
                                }
                            }
                            
                            if usersViewModel.settings.showID {
                                HStack {
                                    Text("ID")
                                    Spacer()
                                    Text("\(user.id.name): \(user.id.value ?? "N/A")")
                                }
                            }
                            
                            if usersViewModel.settings.showNationality {
                                HStack {
                                    Text("Nationality")
                                    Spacer()
                                    Text(user.nat)
                                }
                            }
                        }
                    }
                }
            }
            .listSectionSpacing(10)
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
            .onAppear {
                usersViewModel.getUsers()
            }
        }
    }
}

#Preview {
    UsersView()
}
