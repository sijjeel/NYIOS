//
//  NYIOSApp.swift
//  NYIOS
//
//  Created by muhammad sijjeel on 25/07/2023.
//

import SwiftUI
import NYNetwork

@main
struct NYIOSApp: App {
    var body: some Scene {
        WindowGroup {
            ArticleView(viewModel: createArticleViewModel())
        }
    }
    
    private func createArticleViewModel() -> ArticleViewModel {
        ArticleViewModel(
            articleRepository: DefNYArticleRepository(
                session: configuredURLSession(),
                baseURL: "http://api.nytimes.com"
            )
        )
    }
    
    private func configuredURLSession() -> URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20 * 60
        configuration.timeoutIntervalForResource = 20 * 60
        configuration.waitsForConnectivity = true
        configuration.httpMaximumConnectionsPerHost = 5
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.urlCache = .shared
        return URLSession(configuration: configuration)
    }
}
