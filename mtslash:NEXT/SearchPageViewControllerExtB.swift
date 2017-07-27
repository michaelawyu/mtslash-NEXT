//
//  SearchPageViewControllerExtB.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 7/18/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import UIKit

extension SearchPageViewController {
    
    // A func for animating the transition from the homepage
    func animateTransitionFromHomepage() {
        // Collect views for animation
        let viewCollection : [UIView] = [backButton, searchPromptLabel, searchKeywordTextField, searchHistoryLabel, searchHistoryTableView]
        
        // Hide views
        for view in viewCollection {
            view.alpha = 0.0
        }
        
        // Reveal views
        UIView.animate(withDuration: 0.8) {
            for view in viewCollection {
                view.alpha = 1.0
            }
        }
    }
}
