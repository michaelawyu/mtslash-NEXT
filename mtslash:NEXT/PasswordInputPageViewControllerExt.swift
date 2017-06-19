//
//  PasswordInputPageViewControllerExt.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 6/18/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import Foundation
import UIKit

extension PasswordInputPageViewController {
    
    func authenticateUser() {
        
        // Freeze current page
        let authenticationInProgressAlertController = UIAlertController(title: "正在验证您的账户信息", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        self.present(authenticationInProgressAlertController, animated: true, completion: nil)
        
        let currentUser = UserCredentials.currentUser
        
        // Set up access points and requests
        AccessPoints.selectedAccessPoint = AccessPoints.standardAccessPoint
        let accessPoint = AccessPoints.selectedAccessPoint["user_auth"]! as! [String : Any]
        let url = accessPoint["url"]! as! String
        let params = accessPoint["params"]! as! [String : String]
        var form = accessPoint["form"] as! [String : String]
        form["username"] = currentUser.username!
        form["password"] = currentUser.password!
        let serialParams = RequestHelper.serializePayload(payload: params)
        let serialForm = RequestHelper.serializePayload(payload: form)
        
        let destination = URL(string: url + "?" + serialParams)!
        let session = URLSession.shared
        var request = URLRequest(url: destination)
        request.httpMethod = "POST"
        request.httpBody = serialForm.data(using: String.Encoding.utf8)!
        let task = session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                // Report network error
                let networkErrorAlertController = UIAlertController(title: "发生了一个网络错误", message: "当前无法与服务器建立连接。服务器当前可能不可用，或您的网络配置出现了问题。假如您相信当前连接到的网络对您的访问进行了限制，请尝试使用服务器中转登录重试。", preferredStyle: UIAlertControllerStyle.alert)
                let SignInViaAlternateRouteAction = UIAlertAction(title: "使用服务器中转登录", style: UIAlertActionStyle.default, handler: { (action) in
                    // Switch access point
                    AccessPoints.selectedAccessPoint = AccessPoints.alternateAccessPoint
                    self.authenticateUser()
                })
                let OKAction = UIAlertAction(title: "返回", style: UIAlertActionStyle.default, handler: { (action) in
                    networkErrorAlertController.dismiss(animated: true, completion: nil)
                })
                networkErrorAlertController.addAction(SignInViaAlternateRouteAction)
                networkErrorAlertController.addAction(OKAction)
                authenticationInProgressAlertController.dismiss(animated: true, completion: {
                    self.present(networkErrorAlertController, animated: true, completion: nil)
                })
            } else {
                let HTTPResponse = response as! HTTPURLResponse
                let setCookieParamOpt = (HTTPResponse.allHeaderFields as! [String : String])["Set-Cookie"]
                if let cookies = ResponseHelper.parseAndValidateSetCookieParams(setCookieParamOpt: setCookieParamOpt) {
                    // Set cookies
                    UserCredentials.currentUser.cookies = cookies
                    
                    // Proceed to the next page
                    authenticationInProgressAlertController.dismiss(animated: true, completion: {
                        <#code#>
                    })
                    
                } else {
                    // Report message of access denied
                    let AccessDeniedAlertController = UIAlertController(title: "验证失败", message: "您的用户名或密码不正确，或您使用的用户身份当前没有访问权限。", preferredStyle: UIAlertControllerStyle.alert)
                    let OKAction = UIAlertAction(title: "确认", style: UIAlertActionStyle.default, handler: { (action) in
                        AccessDeniedAlertController.dismiss(animated: true, completion: nil)
                    })
                    AccessDeniedAlertController.addAction(OKAction)
                    authenticationInProgressAlertController.dismiss(animated: true, completion: {
                        self.present(AccessDeniedAlertController, animated: true, completion: nil)
                    })
                }
            }
        }
        task.resume()
        
    }
}
