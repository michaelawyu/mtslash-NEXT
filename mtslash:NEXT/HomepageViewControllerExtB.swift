//
//  HomepageViewControllerExtB.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 6/22/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import UIKit

extension HomepageViewController {
    
    func slidingMenuButtonPressed(sender : SlidingMenuButton) {
        if sender.menuItemOrder == slidingMenuButtons.endIndex {
            return
        } else {
            print(sender.menuItemOrder)
        }
    }
}
