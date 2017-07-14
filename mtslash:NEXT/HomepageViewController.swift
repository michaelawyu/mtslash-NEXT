//
//  HomepageViewController.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 6/19/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import UIKit

class HomepageViewController: UIViewController {
    
    @IBOutlet weak var homepageBackgroundImageView: UIImageView!
    @IBOutlet weak var homepageBackgroundMaskImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var slidingMenuView: UIView!
    @IBOutlet weak var slidingMenuSubtitleLabel: UILabel!
    @IBOutlet weak var viewReadingListButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var slidingMenuDetailViewContainer: UIView!
    @IBOutlet var sectionDetailView: SectionDetailView!
    @IBOutlet var spotlightDetailView: SpotlightDetailView!
    
    var slidingMenuButtons : [ SlidingMenuButton ] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Collect and update all the slidingMenuButtons
        collectSlidingMenuButtons()
        updateSlidingMenuButtons()
        
        // Reset sliding menu items
        SlidingMenuHandler.activeSlidingMenuHandler.reset()
        
        // Set target action of all slidingMenuButtons
        for button in slidingMenuButtons {
            button.addTarget(self, action: #selector(slidingMenuButtonPressed(sender:)), for: .touchUpInside)
        }
        
        // Set target action for viewReadingListButton and searchButton
        viewReadingListButton.addTarget(self, action: #selector(viewReadingListButtonPressed(sender:)), for: .touchUpInside)
        searchButton.addTarget(self, action: #selector(searchButtonPressed(sender:)), for: .touchUpInside)
        
        // Set the content of slidingMenuDetailViewContainer
        SlidingMenuHandler.activeSlidingMenuHandler.updateSlidingMenuDetailView(homepage: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
