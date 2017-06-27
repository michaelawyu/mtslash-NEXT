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
    @IBOutlet weak var slidingMenuView: UIView!
    @IBOutlet weak var slidingMenuSubtitleLabel: UILabel!
    @IBOutlet weak var viewReadingListButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var sectionDetailViewContainer: UIView!
    @IBOutlet var sectionDetailView: SectionDetailView!
    @IBOutlet var spotlightDetailView: SpotlightDetailView!
    
    var slidingMenuButtons : [ SlidingMenuButton ] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectSlidingMenuButtons()
        updateSlidingMenuButtons()
        for button in slidingMenuButtons {
            button.addTarget(self, action: #selector(slidingMenuButtonPressed(sender:)), for: UIControlEvents.touchUpInside)
        }
        SpotlightDetailHandler.activeSpotlightDetailViewHandler.updateSpotlightDetailView()
        sectionDetailViewContainer.addSubview(spotlightDetailView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
