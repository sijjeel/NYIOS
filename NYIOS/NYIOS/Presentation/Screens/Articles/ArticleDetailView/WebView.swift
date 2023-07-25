//
//  HTMLView.swift
//  NYIOS
//
//  Created by muhammad sijjeel on 26/07/2023.
//

import SwiftUI
import WebKit
 
struct WebView: UIViewRepresentable {
    var url: URL
 
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
