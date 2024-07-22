//
//  Settings.swift
//  MockInterviewTwo
//
//  Created by Jordan Fraughton on 7/19/24.
//

import Foundation

struct Settings: Codable, Equatable {
    var userCount: Int = 1
    var showGender: Bool = false
    var showLocation: Bool = false
    var showEmail: Bool = false
    var showLogin: Bool = false
    var showRegistered: Bool = false
    var showDOB: Bool = false
    var showPhone: Bool = false
    var showCell: Bool = false
    var showID: Bool = false
    var showNationality: Bool = false 
}

extension Settings {
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("settings").appendingPathExtension("plist")
    
    static func loadSettings() -> Settings? {
        guard let codedSettings = try? Data(contentsOf: archiveURL) else { return nil }
        
        return try? PropertyListDecoder().decode(Settings.self, from: codedSettings)
    }
    
    static func saveSetting(_ settings: Settings) {
        let codedSettings = try? PropertyListEncoder().encode(settings)
        try? codedSettings?.write(to: archiveURL, options: .noFileProtection)
    }
}
