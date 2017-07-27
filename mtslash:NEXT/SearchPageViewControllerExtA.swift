//
//  SearchPageViewControllerExtA.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 7/18/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import UIKit

extension SearchPageViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Not implemented; sample code only
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Not implemented; sample code only
        return tableView.dequeueReusableCell(withIdentifier: "searchHistoryEntryTableViewCell")!
    }
}
