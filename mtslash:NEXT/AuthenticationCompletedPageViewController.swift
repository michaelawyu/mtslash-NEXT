//
//  AuthenticationCompletedPageViewController.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 6/19/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import UIKit

class AuthenticationCompletedPageViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Hide all elements
        UIView.animate(withDuration: 0.5) { 
            for view in self.view.subviews {
                view.alpha = 0.0
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Reveal all elements
        UIView.animate(withDuration: 0.5) { 
            for view in self.view.subviews {
                // Elements with a tag of 1 has a default alpha value other than 1.0
                if view.tag != 1 {
                    view.alpha = 1.0
                }
                self.backgroundImageView.alpha = 0.04
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func joinUserExperienceImprovementProjectButtonPressed(_ sender: Any) {
        DocumentViewerHelper.initDocumentViewer(viewController: self, URL: URL(string: "http://www.mtslash.org")!, title: "参与用户体验改进计划")
    }
}
