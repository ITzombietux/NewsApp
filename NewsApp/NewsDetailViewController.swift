//
//  NewsDetailViewController.swift
//  NewsApp
//
//  Created by zombietux on 19/11/2018.
//  Copyright © 2018 zombietux. All rights reserved.
//

import UIKit
import WebKit

class NewsDetailViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var imageView:UIImageView?
    @IBOutlet weak var titleLabel:UILabel?
    @IBOutlet weak var authorLabel:UILabel?
    @IBOutlet weak var webView:WKWebView?
    @IBOutlet weak var heightConstraint:NSLayoutConstraint?
    var author:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel?.text = self.title
        authorLabel?.text = self.author
        
        webView?.navigationDelegate = self
        
        let request = URLRequest(url: URL(string: "https://learnappmaking.com/lipsum.html")!)
        webView?.load(request)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!)
    {
        webView.evaluateJavaScript("document.readyState", completionHandler: { result, error in

            if result == nil || error != nil {
                return
            }

            webView.evaluateJavaScript("document.body.offsetHeight", completionHandler: { result, error in
                if let height = result as? CGFloat {
                    self.heightConstraint?.constant = height
                }
            })
        })
    }
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        webView.evaluateJavaScript("document.readyState") { (result, error ) in
//            if result == nil || error != nil {
//                return
//            }
//
//            webView.evaluateJavaScript("document.body.offsetHeight", completionHandler: { (result, error) in
//                if let height = result as? CGFloat {
//                    self.heightConstraint?.constant = height
//                }
//            })
//        }
//    }

}
