//
//  NYArticleRepository.swift
//  NYNetwork
//
//  Created by muhammad sijjeel on 25/07/2023.
//

import Foundation
import Combine
import NYIOSCore

public protocol NYArticleRepository: WebRepository {
    func fetchArticles(section: String, period: Int, apiKey: String) -> AnyPublisher<NYArticle, Error>
}

public struct DefNYArticleRepository: NYArticleRepository {
    public var session: URLSession
    public var baseURL: String
    
    public init(session: URLSession, baseURL: String) {
        self.session = session
        self.baseURL = baseURL
    }
    
    public func fetchArticles(section: String, period: Int, apiKey: String) -> AnyPublisher<NYArticle, Error> {
        call(endpoint: API.fetch(section, period, apiKey))
    }
}

// MARK: - Endpoints

extension DefNYArticleRepository {
    enum API {
        case fetch(String, Int, String)
    }
}

extension DefNYArticleRepository.API: APICall {

    var path: String {
        switch self {
        case .fetch(let section, let period, let apiKey):
            return "/svc/mostpopular/v2/mostviewed/\(section)/\(period).json?api-key=\(apiKey)"
        }
    }

    var method: HTTPMethodType {
        switch self {
        case .fetch:
            return .get
        }
    }

    var headers: [String: String]? {
        [
            "Content-Type": "application/json",
            "Connection": "keep-alive",
            "Accept": "*/*"
        ]
    }
    
    func body() throws -> Data? {
        return nil
    }
}
