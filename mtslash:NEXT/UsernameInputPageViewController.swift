//
//  UsernameInputPageViewController.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 5/22/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import UIKit

class UsernameInputPageViewController: UIViewController, UITextFieldDelegate{
    
    // Outlets
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var usernameInputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Hide all elements
        for view in self.view.subviews {
            view.alpha = 0.0
        }
        
        // Set up virtual keyboard delegate
        usernameInputTextField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Reveal all element
        UIView.animate(withDuration: 0.5) { 
            for view in self.view.subviews {
                // Elements with a tag of 1 has a default alpha value other than 1.0
                if view.tag != 1 {
                    view.alpha = 1.0
                }
            }
            self.backgroundImageView.alpha = 0.04
            self.logoImageView.alpha = 0.9
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Hide the keyboard when the Done key is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    @IBAction func submitUsernameButtonPressed(_ sender: Any) {
        let username = usernameInputTextField.text
        
        // Check if username is valid
        if !UserCredentials.checkValidityOfUsername(username: username) {
            let invalidUsernameAlertController = UIAlertController(title: "无效的用户名", message: "您当前输入的用户名不合法。用户名不应为空，且长度应在3至15个英文字符之间。", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "确认", style: UIAlertActionStyle.default, handler: { (action) in
                invalidUsernameAlertController.dismiss(animated: true, completion: nil)
            })
            invalidUsernameAlertController.addAction(OKAction)
            self.present(invalidUsernameAlertController, animated: true, completion: nil)
        } else {
            // Present the next page
            
            // Set up username of current user
            UserCredentials.currentUser.username = username
            
            // Fade out all elements
            UIView.animate(withDuration: 0.5, animations: {
                for view in self.view.subviews {
                    view.alpha = 0.0
                }
            }, completion: { (ifCompleted) in
                // Transit to the next page
                self.performSegue(withIdentifier: "fromUsernameInputPageToPasswordInputPage", sender: self)
            })
        }
    }
    
    @IBAction func accountHelpButtonPressed(_ sender: Any) {
        DocumentViewerHelper.initDocumentViewer(viewController: self, URL: URL(string: "http://www.mtslash.org")!, title: "账户问题帮助")
    }
    
    @IBAction func registrationButtonPressed(_ sender: Any) {
        DocumentViewerHelper.initDocumentViewer(viewController: self, URL: URL(string: "http://www.mtslash.org")!, title: "注册新账户")
    }

    @IBAction func guestLogonButtonPressed(_ sender: Any) {
    }
    
}
