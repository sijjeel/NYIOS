//
//  ContentView.swift
//  NYIOS
//
//  Created by muhammad sijjeel on 25/07/2023.
//

import SwiftUI
import NYNetwork

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
                viewModel.fetchNYArticles()
            }
            .navigationTitle("Articles")
        } // :NavigationView
    } // :View
}
