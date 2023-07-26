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
    // Properties to be injected.
    public var session: URLSession
    public var baseURL: String
    
    public init(session: URLSession, baseURL: String) {
        self.session = session
        self.baseURL = baseURL
    }
    
    /// This function is responssible to fetch the Articles from API.
    /// - Parameters:
    ///   - section: Which section do you want the articles
    ///   - period: number of  days
    ///   - apiKey: api key is mandatory to call the api
    /// - Returns: Publisher with either return value or error
    public func fetchArticles(section: String, period: Int, apiKey: String) -> AnyPublisher<NYArticle, Error> {
        call(endpoint: API.fetch(section, period, apiKey))
    }
}

// MARK: - Endpoints

extension DefNYArticleRepository {
    /// Here we have all the api methods our apps needs to access.
    enum API {
        case fetch(String, Int, String)
    }
}

extension DefNYArticleRepository.API: APICall {
    ///  Add your api function path
    var path: String {
        switch self {
        case .fetch(let section, let period, let apiKey):
            return "/svc/mostpopular/v2/mostviewed/\(section)/\(period).json?api-key=\(apiKey)"
        }
    }
    /// Http Methods could be get, post, put, delete etc
    var method: HTTPMethodType {
        switch self {
        case .fetch:
            return .get
        }
    }
    /// Headers to call the api.
    var headers: [String: String]? {
        [
            "Content-Type": "application/json",
            "Connection": "keep-alive",
            "Accept": "*/*"
        ]
    }
    /// Body is responsible to add any parameters in the body of the request.
    func body() throws -> Data? {
        return nil
    }
}
