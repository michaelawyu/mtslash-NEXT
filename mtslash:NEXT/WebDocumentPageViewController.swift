//
//  WebDocumentPageViewController.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 5/23/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import UIKit
import WebKit

class WebDocumentPageViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var navBarTitleItem: UINavigationItem!
    
    // Variables
    var documentWebView : WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initiate a WKWebView
        let webViewConfiguration = WKWebViewConfiguration()
        let documentWebView = WKWebView(frame: .zero, configuration: webViewConfiguration)
        view.addSubview(documentWebView)
        self.documentWebView = documentWebView
        
        // Set Constraints
        let viewMargins = view.layoutMarginsGuide
        documentWebView.translatesAutoresizingMaskIntoConstraints = false
        documentWebView.leadingAnchor.constraint(equalTo: viewMargins.leadingAnchor, constant: -20.0).isActive = true
        documentWebView.trailingAnchor.constraint(equalTo: viewMargins.trailingAnchor, constant: 20.0).isActive = true
        documentWebView.topAnchor.constraint(equalTo: viewMargins.topAnchor, constant: 64.0).isActive = true
        documentWebView.bottomAnchor.constraint(equalTo: viewMargins.bottomAnchor).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setDocumenterViewer(documentAddress : URL, title : String) {
        let newRequest = URLRequest(url: documentAddress)
        navBarTitleItem.title = title
        documentWebView.load(newRequest)
    }
    
    @IBAction func returnButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
