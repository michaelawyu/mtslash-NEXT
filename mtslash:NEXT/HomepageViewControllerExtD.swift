//
//  HomepageViewControllerExtD.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 7/14/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import UIKit

// Extension of HomepageViewController
// Includes target actions of viewReadingListButton and searchButton
extension HomepageViewController {
    
    func viewReadingListButtonPressed(sender : UIButton) {
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: [], animations: {
            //
        }) { (ifCompleted) in
            //
        }
        /**
        UIView.animate(withDuration: 0.6) {
            var t = CGAffineTransform.identity
            t = t.translatedBy(x: 22.5, y: 22.5)
            t = t.scaledBy(x: 2.125, y: 2.125)
            self.logoImageView.transform = t
        }
        **/
    }
    
    func searchButtonPressed(sender : UIButton) {
        UIView.animate(withDuration: 0.8, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: [], animations: {
            var t = CGAffineTransform.identity
            t = t.translatedBy(x: 22.5, y: 22.5)
            t = t.scaledBy(x: 2.125, y: 2.125)
            self.logoImageView.transform = t
            self.viewReadingListButton.alpha = 0.0
            self.searchButton.alpha = 0.0
            self.slidingMenuView.alpha = 0.0
            self.slidingMenuDetailViewContainer.alpha = 0.0
            self.homepageBackgroundImageView.alpha = 0.0
            self.homepageBackgroundMaskImageView.alpha = 0.0
        }) { (ifCompleted) in
            self.performSegue(withIdentifier: "fromHomepageToSearchPage", sender: self)
        }
        
    }
}
