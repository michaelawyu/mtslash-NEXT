//
//  SpotlightItemCollectionViewCell.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 6/26/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import UIKit

class SpotlightPanelCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var contentSourceLabel: UILabel!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var spotlightItem : SpotlightItem? = nil {
        didSet {
            let section = Sections.sections[spotlightItem!.sectionIndex]!
            let sectionName = section["section_label"]! as! String
            let panelImage = section["panel_image"]! as! String
            contentSourceLabel.text = spotlightItem!.itemType.rawValue
            sectionLabel.text = sectionName
            backgroundImageView.image = UIImage(named: panelImage)
            titleLabel.text = spotlightItem!.title
        }
    }
    
    // A func for setting round cornors and shadows of collectionViewCell
    func decorate() {
        self.contentView.layer.cornerRadius = 5.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
}
