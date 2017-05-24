//  ViewController.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 5/22/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.

import UIKit

class CoverPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initiate the background
        self.view.backgroundColor = UIColor.white
        let coverImagePath = Bundle.main.path(forResource: "coverImage", ofType: ".jpg")
        let coverImageView = UIImageView(image: UIImage(named: coverImagePath!))
        coverImageView.alpha = 0.95
        self.view.addSubview(coverImageView)
        self.view.sendSubview(toBack: coverImageView)
        
        // Animate the cover image
        UIView.animate(withDuration: 32.0, delay: 0.0, options: [], animations: {
            coverImageView.transform = CGAffineTransform(translationX: -2400.0, y: -900.0)
        }, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signInButtonPressed(_ sender: Any) {
        // Fade out all elements
        UIView.animate(withDuration: 0.5, animations: {
            for view in self.view.subviews {
                view.alpha = 0.0
            }
        }) { (ifCompleted) in
            // Transit to the next page
            self.performSegue(withIdentifier: "fromCoverPageToUsernameInputPage", sender: self)
        }
    }

    @IBAction func infoButtonPressed(_ sender: Any) {
        // Initiate a dialog box for version info and present it
        let versionNumber = Bundle.main.infoDictionary!["ExternalVersionNumber"]! as! String
        let configuration = Bundle.main.infoDictionary!["Configuration"] as! String
        let versionInfoDialogBox = UIAlertController(title: "版本信息", message: "您当前使用的版本为\(versionNumber) (\(configuration))。请访问随缘居网站，了解有关此版本的更多信息。", preferredStyle: UIAlertControllerStyle.alert)
        let OKAction = UIAlertAction(title: "确认", style: UIAlertActionStyle.default) { (action) in
            versionInfoDialogBox.dismiss(animated: true, completion: nil)
        }
        versionInfoDialogBox.addAction(OKAction)
        self.present(versionInfoDialogBox, animated: true, completion: nil)
    }
    
    @IBAction func legalDocumentButtonPressed(_ sender: Any) {
        DocumentViewerHelper.initDocumentViewer(viewController: self, URL: URL(string: "http://www.mtslash.org")!, title: "隐私声明及用户指南")
    }
    
}

