//
//  WebViewPresenter.swift
//  Tamatem
//
//  Created by samir odeh on 18/06/2023.
//
// Presenter for webView to control all logic and filter data for view controller
import Foundation

// MARK: - delegate functions
protocol WebViewPresenterDelegate:NSObject {
    func didFinishLoad()
    func didSetWebURL(url:URLRequest)
    func didFail()
    func didStartLoad()
}

class WebViewPresenter {
    // MARK: - Vars
    weak var delegate:WebViewPresenterDelegate?
    
    // MARK: - functions
    // create URLRequest to load the web view
    func setWebViewURL() {
        let tamatemURL = Constants.url
        let url = URL(string: tamatemURL)
        if let url = url {
            let requestURL = URLRequest(url: url)
            delegate?.didSetWebURL(url: requestURL)
        }
    }
    
    // MARK: - Actions
    func didFinishLoad() {
        delegate?.didFinishLoad()
    }
    
    func didStartLoad() {
        delegate?.didStartLoad()
    }
    
    func didFail() {
        delegate?.didFail()
    }
}
