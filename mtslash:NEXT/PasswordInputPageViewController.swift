//
//  PasswordInputPageViewController.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 5/23/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import UIKit

class PasswordInputPageViewController: UIViewController, UITextFieldDelegate {
    
    // Outlets
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var passwordInputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Hide all elements
        for view in self.view.subviews {
            view.alpha = 0.0
        }
        
        // Set up virtual keyboard delegate
        passwordInputTextField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Reveal all elements
        UIView.animate(withDuration: 0.5) {
            for view in self.view.subviews {
                // Elements with a tag of 1 has a default alpha value other than 1.0
                if view.tag != 1 {
                    view.alpha = 1.0
                }
            }
            self.backgroundImageView.alpha = 0.03
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
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        func authenticationViaStandardAccessPointHelper() {
            // Select standard access point for user authentication
            AccessPoints.selectedAccessPoint = AccessPoints.standardAccessPoint
            
            // Authenticate user credentials
            authenticateUser()
        }
        
        passwordCheckHelper(completionHandler: authenticationViaStandardAccessPointHelper)
    }
    
    @IBAction func submitViaProxyButtonPressed(_ sender: Any) {
        
        func authenticationViaAlternateAccessPointHelper() {
            // Select alternate access point for user authentication
            AccessPoints.selectedAccessPoint = AccessPoints.alternateAccessPoint
            
            // Authenticate user credentials
            authenticateUser()
        }
        
        passwordCheckHelper(completionHandler: authenticationViaAlternateAccessPointHelper)
    }
    
    @IBAction func accountHelpButtonPressed(_ sender: Any) {
        DocumentViewerHelper.initDocumentViewer(viewController: self, URL: URL(string: "http://www.mtslash.org")!, title: "账户问题帮助")
    }
    
    @IBAction func changeAccountButtonPressed(_ sender: Any) {
        // Fade out all elements
        UIView.animate(withDuration: 0.5, animations: {
            for view in self.view.subviews {
                view.alpha = 0.0
            }
        }) { (ifCompleted) in
            self.performSegue(withIdentifier: "fromPasswordInputPageToUsernameInputPage", sender: self)
        }
    }
    
    // A convenient func for password checking and initiation of authentication process
    func passwordCheckHelper(completionHandler: () -> ()) {
        let password = passwordInputTextField.text
        
        // Check if password is valid
        if !UserCredentials.checkValidityOfPassword(password: password) {
            let invalidPasswordAlertController = UIAlertController(title: "无效的密码", message: "您当前输入的密码不合法。密码不应为空，且长度应小于20个英文字符。", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "确认", style: UIAlertActionStyle.default, handler: { (action) in
                invalidPasswordAlertController.dismiss(animated: true, completion: nil)
            })
            invalidPasswordAlertController.addAction(OKAction)
            self.present(invalidPasswordAlertController, animated: true, completion: nil)
        } else {
            // Set up password for current user
            UserCredentials.currentUser.password = password
            
            completionHandler()
        }
    }
}
