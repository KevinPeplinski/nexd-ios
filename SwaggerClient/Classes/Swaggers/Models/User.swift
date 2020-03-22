//
// User.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct User: Codable {

    public var street: String?
    public var number: String?
    public var zipCode: String?
    public var city: String?
    public var firstName: String
    public var lastName: String
    public var email: String
    public var role: String
    public var telephone: String?

    public init(street: String?, number: String?, zipCode: String?, city: String?, firstName: String, lastName: String, email: String, role: String, telephone: String?) {
        self.street = street
        self.number = number
        self.zipCode = zipCode
        self.city = city
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.role = role
        self.telephone = telephone
    }


}
