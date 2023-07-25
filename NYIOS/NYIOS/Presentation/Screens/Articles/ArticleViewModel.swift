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
    private let articleRepository: NYArticleRepository
    private var cancelBag = CancelBag()
    
    @Published var article: NYArticle = NYArticle.empty()
    
    init(articleRepository: NYArticleRepository) {
        self.articleRepository = articleRepository
    }
    
    func fetchNYArticles() {
        articleRepository.fetchArticles(
            section: "all-sections",
            period: 7,
            apiKey: "23E6G948xA5MIB1xOvLtVCWbNKGjmWSa"
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
