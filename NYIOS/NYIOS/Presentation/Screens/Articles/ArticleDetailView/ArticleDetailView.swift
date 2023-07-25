//
//  ArticleDetailView.swift
//  NYIOS
//
//  Created by muhammad sijjeel on 26/07/2023.
//

import SwiftUI

struct ArticleDetailView: View {
    let urlString: String
    
    var body: some View {
        WebView(url: URL(string: urlString)!)
            .navigationTitle("Article")
    }
}
