//
//  fromCoverPageToUsernameInputPage.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 5/22/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import UIKit

class customSegueFromCoverPageToUsernameInputPage: UIStoryboardSegue {
    
    override func perform() {
        self.source.present(self.destination, animated: false, completion: nil)
    }
}
