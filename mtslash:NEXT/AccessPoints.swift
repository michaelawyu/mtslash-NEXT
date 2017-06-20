//
//  AccessPoints.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 6/17/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import Foundation

// A class for loading access points from files

class AccessPoints {
    
    static let (standardAccessPoint, alternateAccessPoint) = loadAccessPointsFromFile()
    static var selectedAccessPoint = standardAccessPoint
    
    static func loadAccessPointsFromFile() -> ([String : Any], [String : Any]) {
        let standardAccessPointDataURL = Bundle.main.url(forResource: "stdAPData", withExtension: "json")!
        let alternateAccessPointDataURL = Bundle.main.url(forResource: "altAPData", withExtension: "json")!
        let standardAccessPointData = try! Data(contentsOf: standardAccessPointDataURL)
        let alternateAccessPointData = try! Data(contentsOf: alternateAccessPointDataURL)
        let standardAccessPoint =  try! JSONSerialization.jsonObject(with: standardAccessPointData, options: [])
        let alternateAccessPoint = try! JSONSerialization.jsonObject(with: alternateAccessPointData, options: [])
        
        return (standardAccessPoint as! [String : Any], alternateAccessPoint as! [String : Any])
    }
}
