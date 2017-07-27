//
//  SearchPageViewControllerExtC.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 7/18/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import UIKit

extension SearchPageViewController {
    
    func backButtonPressed(sender: UIButton) {
        self.performSegue(withIdentifier: "fromSearchPageToHomepage", sender: self)
    }
}
