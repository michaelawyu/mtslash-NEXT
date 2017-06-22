//
//  HomepageViewControllerExt.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 6/22/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import UIKit

extension HomepageViewController {
    
    // A func for collecting all buttons from the sliding menu into a sorted array
    func collectSlidingMenuButtons() {
        let subviews = slidingMenuView.subviews
        
        for view in subviews {
            if let item = view as? SlidingMenuButton {
                slidingMenuButtons.append(item)
            }
        }
        
        print(slidingMenuButtons.count)
        
        func compareSlidingMenuButtons(firstButton : SlidingMenuButton, secondButton: SlidingMenuButton) -> Bool {
            let firstButtonOrder = firstButton.menuItemOrder
            let secondButtonOrder = secondButton.menuItemOrder
            
            if firstButtonOrder <= secondButtonOrder {
                return true
            } else {
                return false
            }
        }
        
        slidingMenuButtons.sort(by: compareSlidingMenuButtons(firstButton:secondButton:))
    }
    
    func refreshSlidingMenuButtons() {
        let slidingMenuItems = SlidingMenuHandler.activeSlidingMenuHandler.slidingMenuItems
        
        for i in 0 ..< slidingMenuItems.endIndex {
            let item = slidingMenuItems[i]
            let button = slidingMenuButtons[i]
            button.setTitle(item["title"]!, for: UIControlState.normal)
        }
        
        slidingMenuSubtitleLabel.text = slidingMenuItems.last!["subtitle"]!
    }
}
