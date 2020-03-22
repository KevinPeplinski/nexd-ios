//
// ResponseTokenDto.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct ResponseTokenDto: Codable {

    /** seconds until expiration */
    public var expiresIn: Int
    /** jwt token */
    public var accessToken: String
    /** user id */
    public var _id: Int

    public init(expiresIn: Int, accessToken: String, _id: Int) {
        self.expiresIn = expiresIn
        self.accessToken = accessToken
        self._id = _id
    }

    public enum CodingKeys: String, CodingKey { 
        case expiresIn
        case accessToken
        case _id = "id"
    }

}

