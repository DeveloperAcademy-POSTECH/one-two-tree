//
//  WebView.swift
//  prototype
//
//  Created by κΉνμ on 2022/04/07.
//

import SwiftUI
import WebKit

//WebView From UIKit...

struct WebView: UIViewRepresentable {
    var url: URL
    func makeUIView(context: Context) -> WKWebView {
     
        let view = WKWebView()
        view.load(URLRequest(url: url))
        
        //Scaling WEB View
        view.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}
