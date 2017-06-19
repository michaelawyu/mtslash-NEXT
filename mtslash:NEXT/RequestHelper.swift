//
//  RequestHelper.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 6/18/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import Foundation

// A class of convenient methods for setting up requests

class RequestHelper {
    
    // A func for serializing the payload
    static func serializePayload(payload : [String : String]) -> String {
        
        var serialPayload = [String]()
        
        for (key, value) in payload {
            let item = key + "=" + value
            serialPayload.append(item)
        }
        
        return serialPayload.joined(separator: "&")
    }
}
