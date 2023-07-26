//
//  NYIOSApp.swift
//  NYIOS
//
//  Created by muhammad sijjeel on 25/07/2023.
//

import SwiftUI

@main
struct NYIOSApp: App {
    var body: some Scene {
        WindowGroup {
            ArticleView(viewModel: AppEnvironment.createArticleViewModel())
        }
    }
}
