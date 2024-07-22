//
//  UserImageViewModel.swift
//  MockInterviewTwo
//
//  Created by Jordan Fraughton on 7/21/24.
//

import Foundation
import UIKit

class UserImageViewModel: ObservableObject {
    var user: User
    
    @Published var userImage: UIImage?
    
    init(user: User) {
        self.user = user
    }
    
    @MainActor
    func getUserImage() {
        Task {
            do {
                let uiImage = try await NetworkController().fetchImage(from: user.picture.thumbnail)
                userImage = uiImage
            } catch {
                throw error
            }
        }
    }
}
