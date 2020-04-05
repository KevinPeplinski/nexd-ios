//
// CreateOrUpdateHelpRequestArticleDto.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct CreateOrUpdateHelpRequestArticleDto: Codable { 


    /** Number of items */
    public var articleCount: Int64
    public var articleDone: Bool?

    public init(articleCount: Int64, articleDone: Bool?) {
        self.articleCount = articleCount
        self.articleDone = articleDone
    }

}