//
//  AppEnvironment.swift
//  NYIOS
//
//  Created by muhammad sijjeel on 26/07/2023.
//

import Foundation
import NYNetwork

struct AppEnvironment {
    static func createArticleViewModel() -> ArticleViewModel {
        ArticleViewModel(
            articleRepository: DefNYArticleRepository(
                session: URLSession(configuration: URLSessionConfiguration.default),
                baseURL: Constants.baseUrl
            )
        )
    }
}
