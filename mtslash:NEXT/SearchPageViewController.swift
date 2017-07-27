//
//  SearchPageViewController.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 7/14/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import UIKit

class SearchPageViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var searchPromptLabel: UILabel!
    @IBOutlet weak var searchKeywordTextField: UITextField!
    @IBOutlet weak var searchHistoryLabel: UILabel!
    @IBOutlet weak var searchHistoryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set target action for backButton
        backButton.addTarget(self, action: #selector(backButtonPressed(sender:)), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
