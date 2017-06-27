//
//  SlidingMenuHandler.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 6/22/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import Foundation

// A class for handling sliding menu

class SlidingMenuHandler {
    
    // Singleton
    static let activeSlidingMenuHandler = SlidingMenuHandler()
    
    var slidingMenuItems : [[String : String]] = []
    
    private init() {
        // Load sliding menu items from file
        let slidingMenuItemsDataURL = Bundle.main.url(forResource: "slidingMenuItems", withExtension: "json")!
        let slidingMenuItemsData = try! Data(contentsOf: slidingMenuItemsDataURL)
        slidingMenuItems = (try! JSONSerialization.jsonObject(with: slidingMenuItemsData, options: [])) as! [[String : String]]
    }
    
    // Update the order of sliding menu items when a specific item is focused (selected).
    func focusAt(index : Int) {
        if index == slidingMenuItems.endIndex {
            return
        }
        
        let selectedItem = slidingMenuItems[index - 1]
        
        if index == 1 {
            slidingMenuItems.remove(at: 0)
            slidingMenuItems.append(selectedItem)
            return
        }
        
        let beforeItems = slidingMenuItems[0 ..< index - 1]
        let afterItems = slidingMenuItems[index ..< slidingMenuItems.endIndex]
        slidingMenuItems = afterItems + beforeItems + [selectedItem]
    }
}
