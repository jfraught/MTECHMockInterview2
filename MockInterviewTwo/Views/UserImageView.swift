//
//  UserImageView.swift
//  MockInterviewTwo
//
//  Created by Jordan Fraughton on 7/21/24.
//

import SwiftUI

struct UserImageView: View {
    @StateObject var userImageViewModel: UserImageViewModel
    
    var body: some View {
        Group {
            if let userImage = userImageViewModel.userImage {
                Image(uiImage: userImage)
            } else {
                Image(systemName: "person.circle")
            }
        }
        .onAppear {
            userImageViewModel.getUserImage()
        }
    }
}
