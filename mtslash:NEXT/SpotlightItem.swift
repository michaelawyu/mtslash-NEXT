//
//  SpotlightItem.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 6/27/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import Foundation

class SpotlightItem {
    
    var itemType : SpotlightItemType
    var sectionIndex : String
    var title : String
    var link : String
    
    init(itemType : SpotlightItemType, sectionIndex : String, title: String, link: String) {
        self.itemType = itemType
        self.sectionIndex = sectionIndex
        self.title = title
        self.link = link
    }
}
