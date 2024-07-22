//
//  NetworkController.swift
//  MockInterviewTwo
//
//  Created by Jordan Fraughton on 7/19/24.
//

import Foundation
import UIKit

class NetworkController {
    enum NetworkError: Error, LocalizedError {
        case couldNotGetUsers
        case couldNotLoadPhoto
    }
    
    let decoder = JSONDecoder()
    
    func getUsers(_ numberOfUsers: Int) async throws -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        var request = URLRequest(url: URL(string: "https://randomuser.me/api/?results=\(numberOfUsers)")!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.couldNotGetUsers
        }
        
        let users = try decoder.decode(Users.self, from: data)
        User.users = users.results
        
        return true 
    }
    
    func fetchImage(from imageURL: URL) async throws -> UIImage? {
        let (data, response) = try await URLSession.shared.data(from: imageURL)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.couldNotLoadPhoto
        }
        
        let uiImage = UIImage(data: data)
        
        return uiImage
    }
}
