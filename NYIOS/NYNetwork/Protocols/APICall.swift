//
//  APICall.swift
//  NYNetwork
//
//  Created by muhammad sijjeel on 25/07/2023.
//

import Foundation

protocol APICall {
    var path: String { get }
    var method: HTTPMethodType { get }
    var headers: [String: String]? { get }
    func body() throws -> Data?
}

extension APICall {
    
    /// Create a api request by appending path with base url to get the complete url.
    /// - Parameter baseURL: base url of our api.
    /// - Returns: return URLRequest.
    func urlRequest(baseURL: String) throws -> URLRequest {
        guard let url = URL(string: baseURL + path) else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = try body()
        return request
    }
}
