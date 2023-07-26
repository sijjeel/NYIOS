//
//  ArticleViewModel.swift
//  NYIOS
//
//  Created by muhammad sijjeel on 25/07/2023.
//

import Foundation
import NYNetwork
import Combine
import NYIOSCore

final class ArticleViewModel: ObservableObject {
    // MARK: Properties
    private let articleRepository: NYArticleRepository
    private var cancelBag = CancelBag()
    
    @Published var article: NYArticle = NYArticle.empty()
    
    // MARK: Initializer
    init(articleRepository: NYArticleRepository) {
        self.articleRepository = articleRepository
    }
    
    // MARK: Functions
    /// Fetch the most popular articles from api.
    func fetchNYArticles(section: String, period: Int) {
        articleRepository.fetchArticles(
            section: section,
            period: period,
            apiKey: Constants.apiKey
        )
            .receive(on: DispatchQueue.main)
            .sink (receiveCompletion: { result in
                if case .failure(let error) = result {
                    print(error)
                }
            }, receiveValue: { [weak self] articles in
                print(articles)
                self?.article = articles
            })
            .store(in: cancelBag)
    }
}
