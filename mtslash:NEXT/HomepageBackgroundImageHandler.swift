//
//  HomepageBackgroundImageHandler.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 6/22/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import Foundation
import UIKit

class HomepageBackgroundImageHandler {
    
    static let activeHomepageBackgroundImageHandler = HomepageBackgroundImageHandler()
    var allBackgroundImages : [String] = []
    var movieBackgroundImages : [String] = []
    var tvBackgroundImages : [String] = []
    
    private init() {
        let sections = Sections.sections
        allBackgroundImages = []
        movieBackgroundImages = []
        tvBackgroundImages = []
        
        for section in sections {
            if let backgroundImageFilename = section.value["background_image"] as? String {
                allBackgroundImages.append(backgroundImageFilename)
            }
        }
        var subsectionsInMovieFanfic = Sections.sections["mov_tre"]!["categories"]! as! [String]
        subsectionsInMovieFanfic.append("mov_avengers")
        for subsection in subsectionsInMovieFanfic {
            if let backgroundImageFilename = sections[subsection]!["background_image"] as? String {
                movieBackgroundImages.append(backgroundImageFilename)
            }
        }
        
        var subsectionsInTVFanfic = Sections.sections["tv_tre"]!["categories"]! as! [String]
        subsectionsInTVFanfic.append("tv_sherlock")
        for subsection in subsectionsInTVFanfic {
            if let backgroundImageFilename = sections[subsection]!["background_image"] as? String {
                tvBackgroundImages.append(backgroundImageFilename)
            }
        }
    }
    
    // A func for generating the next background image
    // Returns an UIImage as the next background and alpha values for backgroundMaskImageView and backgroundImageView
    func getHomepageBackgroundImage(sender : SlidingMenuButton) -> (backgroundImage : UIImage, alphaForMask: Float, alphaForImage: Float) {
        let selectedItemTitle = SlidingMenuHandler.activeSlidingMenuHandler.slidingMenuItems[sender.menuItemOrder - 1]["title"]!
        let selectedBackgroundImageList : [String]
        
        if selectedItemTitle == "SPOTLIGHT" {
            let backgroundImage = UIImage(named: "homepage_background_protostar.jpg")!
            return (backgroundImage, 0.0, 0.04)
        }
        
        switch selectedItemTitle {
        case "MOVIE FANFIC":
            selectedBackgroundImageList = movieBackgroundImages
        case "TV FANFIC":
            selectedBackgroundImageList = tvBackgroundImages
        default:
            selectedBackgroundImageList = allBackgroundImages
        }
        
        let imageIndex = Int(arc4random_uniform(UInt32(selectedBackgroundImageList.count - 1)))
        let backgroundImage = UIImage(named: selectedBackgroundImageList[imageIndex])!
        return (backgroundImage, 0.5, 1.0)
    }
    
}
