//
//  SpotlightDetailViewHandler.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 6/27/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import Foundation
import UIKit

class SpotlightDetailViewHandler {
    
    // Singleton
    static let activeSpotlightDetailViewHandler = SpotlightDetailViewHandler()
    
    private init() {}
    
    var spotlightItems : [SpotlightItem] = []
    
    func updateSpotlightDetailView() {
        // To be implemented; sample code only
        
        // Clear spotlightItems
        spotlightItems.removeAll()
        
        // Insert a new spotlight panel
        let sampleSpotlightItem = SpotlightItem(itemType: .HelpAndSupport, sectionIndex: "reserved", title: "使用指南", link: "http://www.mtslash.net")
        spotlightItems.append(sampleSpotlightItem)
    }
    
    static func viewSpotlightItemContent(viewController : UIViewController, spotlightItem : SpotlightItem) {
        // To be implemented; sample code only
        
        let link = spotlightItem.link
        let itemType = spotlightItem.itemType
        
        switch itemType {
        case .HelpAndSupport:
            DocumentViewerHelper.initDocumentViewer(viewController: viewController, URL: URL(string: link)!, title: "帮助与支持文档")
        }
    }
}
