//
//  Sections.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 6/25/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import Foundation

class Sections {
    
    static let sections : [String : [String : Any]] = loadSectionsFromFile()
    
    private static func loadSectionsFromFile() -> [String : [String : Any]] {
        let sectionsDataURL = Bundle.main.url(forResource: "sections", withExtension: "json")!
        let sectionsData = try! Data(contentsOf: sectionsDataURL)
        let sections = try! JSONSerialization.jsonObject(with: sectionsData, options: [])
        return sections as! [String : [String : Any]]
    }
}
