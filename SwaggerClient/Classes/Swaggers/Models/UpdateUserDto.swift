//
// UpdateUserDto.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct UpdateUserDto: Codable {

    public enum Role: String, Codable { 
        case helper = "helper"
        case seeker = "seeker"
    }
    public var street: String?
    public var number: String?
    public var zipCode: String?
    public var city: String?
    public var firstName: String
    public var lastName: String
    public var role: Role
    public var telephone: String?

    public init(street: String?, number: String?, zipCode: String?, city: String?, firstName: String, lastName: String, role: Role, telephone: String?) {
        self.street = street
        self.number = number
        self.zipCode = zipCode
        self.city = city
        self.firstName = firstName
        self.lastName = lastName
        self.role = role
        self.telephone = telephone
    }


}
