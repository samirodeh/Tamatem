//
//  webViewVC.swift
//  Tamatem
//
//  Created by samir odeh on 18/06/2023.
//

import UIKit
import WebKit

class webViewVC: UIViewController {
    // MARK: - @IBOutlet
    @IBOutlet weak var webViewContiner: WKWebView!
    @IBOutlet weak var controlBarView: ControlBarView!
    
    // MARK: - Vars
    private var presenter:WebViewPresenter = WebViewPresenter()
    private var webViewManager:WebViewManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPresenter()
        setWebViewDelegate()
        setControlBar()
    }
    
    deinit {
        print(#function)
    }
    
    init() {
        super.init(nibName: "webViewVC", bundle: nil)
        self.modalPresentationStyle = .fullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Setrs
    private func setControlBar() {
        controlBarView.delegate = self
    }
    
    private func setWebViewDelegate() {
        webViewManager = WebViewManager()
        webViewContiner.navigationDelegate = webViewManager
        webViewManager.setPresenter(presenter: self.presenter)
        self.presenter.setWebViewURL()
    }
    
    private func setPresenter() {
        self.presenter.delegate = self
    }
    
    // MARK: - @IBAction
    @IBAction func backAction(_ sender: Any) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.dismiss(animated: true)
        }
    }
    
}

// MARK: - Extension
extension webViewVC:ControlDelegate {
    func didEnterBackward() {
        webViewContiner.goBack()
    }
    func didEnterForward() {
        webViewContiner.goForward()
    }
    func didEnterRefresh() {
        webViewContiner.reload()
    }
}

extension webViewVC : WebViewPresenterDelegate {
    func didFail() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.controlBarView.progressView.setProgress(0.0, animated: true)
            self.controlBarView.progressView.isHidden = true
        }

    }
    
    func didStartLoad() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.controlBarView.progressView.setProgress(0.1, animated: false)
            self.controlBarView.progressView.isHidden = false
        }
    }
    
    func didFinishLoad() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.controlBarView.progressView.setProgress(1.0, animated: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1 , execute: { [weak self] in
                guard let self = self else {return}
                self.controlBarView.progressView.isHidden = true
            })
        }
    }

    func didSetWebURL(url: URLRequest) {
        self.webViewContiner.load(url)
    }
}
