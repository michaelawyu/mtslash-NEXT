//
//  ResponseHelper.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 6/18/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import Foundation

// A class of convenient funcs for processing responses

class ResponseHelper {
    
    // A func for parsing the "Set-Cookie" params in HTTP header
    static func parseAndValidateSetCookieParams(setCookieParamOpt : String?) -> [String : String]? {
        if let setCookieParam = setCookieParamOpt {
            let cookieJars = setCookieParam.components(separatedBy: "path=/, ")
            var cookies = [String : String]()
            for cookieJar in cookieJars {
                let rawCookie = cookieJar.components(separatedBy: ";")[0]
                let keyValuePair = rawCookie.components(separatedBy: "=")
                cookies[keyValuePair[0]] = keyValuePair[1]
            }
        
            if let _ = cookies["QNTU_2132_auth"] {
                return cookies
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
}
