//
//  NYNetworkTests.swift
//  NYNetworkTests
//
//  Created by muhammad sijjeel on 25/07/2023.
//

import XCTest
@testable import NYNetwork

class NYNetworkTests: XCTestCase {
    func test_shouldHaveCorrectURLPath() {
        let baseURL = "http://api.nytimes.com"

        let expectedURL = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=23E6G948xA5MIB1xOvLtVCWbNKGjmWSa"
        
        do {
            let request = try DefNYArticleRepository.API.fetch("all-sections", 7, "23E6G948xA5MIB1xOvLtVCWbNKGjmWSa").urlRequest(baseURL: baseURL)
            XCTAssertEqual(request.url?.absoluteString, expectedURL)
        } catch {
            XCTAssertThrowsError("Request not properly made")
        }
    }
}
