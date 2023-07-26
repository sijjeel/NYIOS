//
//  File.swift
//  NYIOSTests
//
//  Created by muhammad sijjeel on 26/07/2023.
//

import Foundation
import NYNetwork
import NYIOSCore
import Combine

struct NYArticleRepositoryMock: NYArticleRepository {
    var session: URLSession = URLSession(configuration: URLSessionConfiguration.default)
    var baseURL: String
    let testBundle: Bundle
    
    func fetchArticles(section: String, period: Int, apiKey: String) -> AnyPublisher<NYArticle, Error> {
        fetchArticlesMock(section: section, period: period, apiKey: apiKey)
    }
}

extension NYArticleRepositoryMock {
    private func fetchArticlesMock(
        section: String,
        period: Int,
        apiKey: String) -> AnyPublisher<NYArticle, Error> {
            if section.isEmpty || apiKey.isEmpty {
                let error = NSError(
                    domain: "http://api.nytimes.com",
                    code: 0,
                    userInfo: [NSLocalizedDescriptionKey: "Section or apiKey is empty"]
                )
                return Fail(error: error).eraseToAnyPublisher()
            }
            
        return decodeFile()
    }
    
    private func decodeFile() -> AnyPublisher<NYArticle, Error> {
        guard let url = testBundle.url(forResource: "ArticleJson", withExtension: "json") else {
            let error = NSError(
                domain: "http://api.nytimes.com",
                code: 0,
                userInfo: [NSLocalizedDescriptionKey: "JSON file not found"]
            )
            return Fail(error: error).eraseToAnyPublisher()
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()

            let nyArticle = try decoder.decode(NYArticle.self, from: data)

            return Just(nyArticle).setFailureType(to: Error.self).eraseToAnyPublisher()
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
}
