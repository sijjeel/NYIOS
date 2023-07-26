//
//  ContentView.swift
//  NYIOS
//
//  Created by muhammad sijjeel on 25/07/2023.
//

import SwiftUI

struct ArticleView: View {
    // MARK: Property
    @ObservedObject var viewModel: ArticleViewModel
    
    // MARK: Body
    var body: some View {
        NavigationView {
            List(viewModel.article.results) { article in
                NavigationLink(destination: ArticleDetailView(urlString: article.url)) {
                    ArticleViewCell(
                        title: article.title,
                        author: article.byline,
                        date: article.publishedDate)
                } // :NavigationLink
            } // :List
            .onAppear {
                viewModel.fetchNYArticles(
                    section: "all-sections",
                    period: 7
                )
            }
            .navigationTitle("Articles")
        } // :NavigationView
    } // :View
}
