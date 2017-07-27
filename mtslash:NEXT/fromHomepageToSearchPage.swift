//
//  fromHomepageToSearchPage.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 7/14/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import UIKit

class fromHomepageToSearchPage: UIStoryboardSegue {
    override func perform() {
        let src = self.source as! HomepageViewController
        let dest = self.destination as! SearchPageViewController
        
        // Animate the transition away from homepage
        UIView.animate(withDuration: 0.8, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: [], animations: {
                var t = CGAffineTransform.identity
                t = t.translatedBy(x: 22.5, y: 22.5)
                t = t.scaledBy(x: 2.125, y: 2.125)
                src.logoImageView.transform = t
                
                // Collect views for animation
                let viewCollection : [UIView] = [src.viewReadingListButton, src.searchButton, src.slidingMenuView,src.slidingMenuDetailViewContainer, src.homepageBackgroundImageView, src.homepageBackgroundMaskImageView]
                for view in viewCollection {
                    view.alpha = 0.0
                }
        }) { (ifCompleted) in
            // Present destination view controller
            src.present(dest, animated: false) {
                // Animate the transition into search page
                // Collect views for animation
                let viewCollection : [UIView] = [dest.backButton, dest.searchPromptLabel, dest.searchKeywordTextField, dest.searchHistoryLabel, dest.searchHistoryTableView]
                
                // Hide views
                for view in viewCollection {
                    view.alpha = 0.0
                }
                
                // Reveal views
                UIView.animate(withDuration: 0.6) {
                    for view in viewCollection {
                        view.alpha = 1.0
                    }
                }
            }
        }
    }
}
