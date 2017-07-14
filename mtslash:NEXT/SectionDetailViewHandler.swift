//
//  SectionDetailViewHandler.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 7/12/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import UIKit

class SectionDetailViewHandler {
    
    // A static func for updating sectionDetailView
    static func updateSectionDetailView(view : SectionDetailView) {
        // Set a transparent background
        view.backgroundColor = UIColor.clear
        
        let item = SlidingMenuHandler.activeSlidingMenuHandler.slidingMenuItems.last!
        
        view.topicCountLabel.text = item["thread_count"]!
        view.replyCountLabel.text = item["reply_count"]!
        view.newTopicCountLabel.text = "今日新增" + item["new_replies"]!
        view.sectionDescriptionLabel.text = item["description"]!
        
        view.subsectionEntriesSeparator.alpha = 0.0
        view.subsectionAEntryButton.alpha = 0.0
        view.subsectionBEntryButton.alpha = 0.0
        
        let noOfSubsections = Int(item["no_of_subsections"]!)!
        
        if noOfSubsections >= 1 {
            view.subsectionEntriesSeparator.alpha = 1.0
            let icon = UIImage(named: item["subsection_1_icon"]!)!
            let title = item["subsection_1"]!
            view.subsectionAEntryButton.setImage(icon, for: .normal)
            view.subsectionAEntryButton.setTitle(" " + title, for: .normal)
            view.subsectionAEntryButton.alpha = 1.0
        }
        
        if noOfSubsections >= 2 {
            let icon = UIImage(named: item["subsection_2_icon"]!)!
            let title = item["subsection_2"]!
            view.subsectionBEntryButton.setImage(icon, for: .normal)
            view.subsectionBEntryButton.setTitle(" " + title, for: .normal)
            view.subsectionBEntryButton.alpha = 1.0
        }
    }
}
