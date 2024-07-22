//
//  User.swift
//  MockInterviewTwo
//
//  Created by Jordan Fraughton on 7/19/24.
//

import Foundation

struct Users: Codable {
    var results: [User]
}

struct User: Codable {
    var gender: String
    var name: Name
    var location: Location
    var email: String
    var login: Login
    var dob: DateOfBirth
    var registered: Registered
    var phone: String
    var cell: String
    var id: ID
    var picture: Picture
    var nat: String
}

extension User {
    static var users = [User]()
}

struct Name: Codable {
    var title: String
    var first: String
    var last: String
}

struct Location: Codable, CustomStringConvertible {
    var description: String {
        "\(String(street.number)) \(street.name) \(city), \(state), \(country)"
    }
    
    var street: Street
    var city: String
    var state: String
    var country: String
    // var postcode: Int, decoding error. Sometimes comes back as string.
    var coordinates: Coordinate
    var timezone: ZoneOfTime
}

struct Street: Codable {
    var number: Int
    var name: String
}

struct Coordinate: Codable {
    var latitude: String
    var longitude: String
}

struct ZoneOfTime: Codable {
    var offset: String
    var description: String
}

struct Login: Codable {
    var uuid: UUID
    var username: String
    var password: String
    var salt: String
    var md5: String
    var sha1: String
    var sha256: String
}

struct DateOfBirth: Codable {
    var date: Date
    var age: Int
}

struct Registered: Codable {
    var date: Date
    var age: Int
}

struct ID: Codable {
    var name: String
    var value: String?
}

struct Picture: Codable {
    var thumbnail: URL
}
