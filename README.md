# Tamatem WebView App

* An app that displays a web view with a control bar.
* The app is built using the MVP architecture.
* The app includes a separate UIView called the ControlBarView with its own delegate:

          protocol ControlDelegate: NSObject {
              func didEnterBackward()
              func didEnterForward()
              func didEnterRefresh()
          }

* This delegate is implemented in the WebViewController to create actions with the WebView.
* The app includes separate calsses for different functionalities. For example, there is a separate CLASS ( WebViewManager ) for the web view, which contains the main WKWebView DELEGATES. The class functions include:

      // MARK: - Delegate functions
      func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
          presenter.didFinishLoad()
      }

      func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
          presenter.didStartLoad()
      }

      func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
          presenter.didFail()
      }

  This delegate is used to separate the web view delegate from the UIViewController and is used to communicate with the presenter for any UI changes needed or to be reflected in the WebViewController.
