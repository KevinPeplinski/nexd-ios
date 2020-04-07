//
// Call.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct Call: Codable { 


    public var sid: String
    public var created: Date
    public var recordUrl: String?
    public var transcriptionUrl: String?
    public var convertedHelpRequest: HelpRequest?
    public var phoneNumber: String?
    public var country: String?
    public var zip: String?
    public var city: String?

    public init(sid: String, created: Date, recordUrl: String?, transcriptionUrl: String?, convertedHelpRequest: HelpRequest?, phoneNumber: String?, country: String?, zip: String?, city: String?) {
        self.sid = sid
        self.created = created
        self.recordUrl = recordUrl
        self.transcriptionUrl = transcriptionUrl
        self.convertedHelpRequest = convertedHelpRequest
        self.phoneNumber = phoneNumber
        self.country = country
        self.zip = zip
        self.city = city
    }

}