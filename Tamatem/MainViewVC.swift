//
//  ViewController.swift
//  Tamatem
//
//  Created by samir odeh on 18/06/2023.
//

import UIKit

class MainViewVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func presentWebView(_ sender: Any) {
        let webView = webViewVC()
        self.present(webView, animated: true)
    }
    
}

