//
//  NYArticle.swift
//  NYIOSCore
//
//  Created by muhammad sijjeel on 25/07/2023.
//

import Foundation

struct NYArticle: Codable {
    let status, copyright: String
    let numResults: Int
    let results: [NYResult]

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}
