//
//  ArticleViewModelTests.swift
//  NYIOSTests
//
//  Created by muhammad sijjeel on 26/07/2023.
//

import XCTest
import Combine
@testable import NYIOS

class ArticleViewModelTests: XCTestCase {
    private var cancelBag = CancelBag()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        cancelBag.cancel()
        try super.tearDownWithError()
    }

    func test_sectionOrApiKeyIsEmpty() {
        let testBundle = Bundle(for: type(of: self))
        let articleRepositoryMock = NYArticleRepositoryMock(
            baseURL: Constants.baseUrl,
            testBundle: testBundle
        )
        
        // Expect Section or api key is empty
        let expectation = XCTestExpectation(description: "Section or Api Key is empty")
        
        articleRepositoryMock.fetchArticles(section: "", period: 0, apiKey: "")
            .sink (receiveCompletion: { result in
                if case .failure(let error) = result {
                    XCTAssertEqual(error.localizedDescription, "Section or apiKey is empty")
                    expectation.fulfill()
                }
            }, receiveValue: { articles in
                // Assert object is nil
                XCTAssertNil(articles, "Object is nil")
                // Fulfill the expectation
                expectation.fulfill()
            })
            .store(in: cancelBag)
        wait(for: [expectation], timeout: 1)
    }
    
    func test_articleShouldNotBeEmpty() {
        let testBundle = Bundle(for: type(of: self))
        let articleRepositoryMock = NYArticleRepositoryMock(
            baseURL: Constants.baseUrl,
            testBundle: testBundle
        )
        let sut = ArticleViewModel(articleRepository: articleRepositoryMock)
        
        // result should not be empty.
        let expectation = XCTestExpectation(description: "Fetch articles")

        sut.$article
            .dropFirst()
            .sink(receiveValue: {articles in
                // Assert results array is not empty
                XCTAssertFalse(articles.results.isEmpty, "Articles should not be empty")
                // Fulfill the expectation
                expectation.fulfill()
            })
            .store(in: cancelBag)
        
         sut.fetchNYArticles(
            section: "all-sections",
            period: 7
         )

        // Wait for the expectation to be fulfilled, with a timeout if needed
        wait(for: [expectation], timeout: 5)
    }
}
