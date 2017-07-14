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
        self.source.present(self.destination, animated: false, completion: nil)
    }
}
