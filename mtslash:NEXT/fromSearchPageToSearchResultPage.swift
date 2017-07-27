//
//  fromSearchPageToSearchResultPage.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 7/28/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import UIKit

class fromSearchPageToSearchResultPage: UIStoryboardSegue {
    // Not implemented; sample code only 
    override func perform() {
        self.source.present(self.destination, animated: true, completion: nil)
    }
}
