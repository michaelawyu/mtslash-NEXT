//
//  SlidingMenuHandler.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 6/22/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import UIKit

// A class for handling the content of sliding menu
class SlidingMenuHandler {
    
    // Singleton
    static let activeSlidingMenuHandler = SlidingMenuHandler()
    
    var slidingMenuItems : [[String : String]] = []
    
    private init() {
        reset()
    }
    
    func reset() {
        // Load sliding menu items from file
        let slidingMenuItemsDataURL = Bundle.main.url(forResource: "slidingMenuItems", withExtension: "json")!
        let slidingMenuItemsData = try! Data(contentsOf: slidingMenuItemsDataURL)
        slidingMenuItems = (try! JSONSerialization.jsonObject(with: slidingMenuItemsData, options: [])) as! [[String : String]]
    }
    
    // Update the order of sliding menu items when a specific item is selected.
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
    
    func updateSlidingMenuDetailView(homepage : HomepageViewController) {
        
        let detailViewContainer = homepage.slidingMenuDetailViewContainer!
        let spotlightDetailView = homepage.spotlightDetailView!
        let sectionDetailView = homepage.sectionDetailView!
        
        // Clear all subviews from container
        for subview in detailViewContainer.subviews {
            subview.removeFromSuperview()
        }
        
        // Add a spotlightDetailView when the sliding menu is focused on item "SPOTLIGHT"
        if slidingMenuItems.last!["title"] == "SPOTLIGHT" {
            // Update spotlightDetailView
            SpotlightDetailViewHandler.activeSpotlightDetailViewHandler.updateSpotlightDetailView()
            // Add spotlightDetailView
            detailViewContainer.addSubview(spotlightDetailView)
        } else {
            SectionDetailViewHandler.updateSectionDetailView(view: sectionDetailView)
            detailViewContainer.addSubview(sectionDetailView)
        }
    }
}
