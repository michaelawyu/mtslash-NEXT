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
    }
    
    // Target action for search button
    func searchButtonPressed(sender : UIButton) {
        self.performSegue(withIdentifier: "fromHomepageToSearchPage", sender: self)
    }
}
