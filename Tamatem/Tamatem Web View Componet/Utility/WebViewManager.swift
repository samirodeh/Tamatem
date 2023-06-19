//
//  WebViewManager.swift
//  Tamatem
//
//  Created by samir odeh on 18/06/2023.
//
// This class is using for webView management and separating the delegate from the main view
// which will communicate with the presenter for an action to be applied on view controller

import Foundation
import WebKit

class WebViewManager:NSObject , WKNavigationDelegate {
    // MARK: - vars
    private var presneter:WebViewPresenter!
    // MARK: - setrs
    func setPresenter(presenter:WebViewPresenter) {
        self.presneter = presenter
    }
    // MARK: - delegates function
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        presneter.didFinishLoad()
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        presneter.didStartLoad()
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        presneter.didFail()
    }
}
