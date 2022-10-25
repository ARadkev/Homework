//
//  ViewController.swift
//  WebBrowserHomework
//
//  Created by AR on 25.10.22.
//

import UIKit
import WebKit

class ViewController: UIViewController, UISearchBarDelegate, UIWebViewDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var searchBar: UISearchBar!
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
            if let url = URL(string: searchBar.text!) {
                webView.load(URLRequest(url: url))
            } else {
                print("Error")
            }
        }
        
    private func webViewDidStartLoad (_ webView: WKWebView) {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        
    private func webViewDidFinishLoad (_ webView: WKWebView) {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        
    override func viewDidLoad() {
    super.viewDidLoad()
        
        let url = URL(string: "https://google.com")!
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func refreshButton(_ sender: UIButton) {
        webView.reload()
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        webView.goBack()
    }
    
    @IBAction func forwardButton(_ sender: UIButton) {
        webView.goForward()
    }
    
    @IBAction func shareButton(_ sender: UIButton) {
    }
    
    @IBAction func readingListButton(_ sender: UIButton) {
    }
    
    @IBAction func showTabsButton(_ sender: UIButton) {
    }
}

