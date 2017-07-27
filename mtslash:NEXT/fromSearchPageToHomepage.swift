//
//  fromSearchPageToHomepage.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 7/18/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import UIKit

class fromSearchPageToHomepage: UIStoryboardSegue {
    override func perform() {
        let src = self.source as! SearchPageViewController
        let dest = self.destination as! HomepageViewController
        
        // Animate the transition away from search page
        UIView.animate(withDuration: 0.8, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: [], animations: {
            var t = CGAffineTransform.identity
            t = t.translatedBy(x: -22.5, y: -22.5)
            t = t.scaledBy(x: 0.4705, y: 0.4705)
            src.logoImageView.transform = t
            
            // Collect views for animation
            let viewCollection : [UIView] = [src.backButton, src.searchPromptLabel, src.searchKeywordTextField, src.searchHistoryLabel, src.searchHistoryTableView]
            for view in viewCollection {
                view.alpha = 0.0
            }
        }) { (ifCompleted) in
            // Present destination view controller
            src.present(dest, animated: false) {
                // Animate the transition into homepage
                // Collect views for animation
                let viewCollection : [UIView] = [dest.viewReadingListButton, dest.searchButton, dest.slidingMenuView, dest.slidingMenuDetailViewContainer]
                
                // Hide views
                for view in viewCollection {
                    view.alpha = 0.0
                }
                dest.homepageBackgroundMaskImageView.alpha = 0.0
                dest.homepageBackgroundImageView.alpha = 0.0
                
                // Reveal views
                UIView.animate(withDuration: 0.6) {
                    for view in viewCollection {
                        view.alpha = 1.0
                    }
                    dest.homepageBackgroundImageView.alpha = 0.04
                    
                }
            }
        }
    }
}
