//
//  NYArticle.swift
//  NYIOSCore
//
//  Created by muhammad sijjeel on 25/07/2023.
//

import Foundation

public struct NYArticle: Codable {
    public let status, copyright: String
    public let numResults: Int
    public let results: [NYResult]
    
    private enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
    
    public static func empty() -> NYArticle {
        NYArticle(status: "", copyright: "", numResults: 0, results: [])
    }
}
