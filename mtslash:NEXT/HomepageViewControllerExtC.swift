//
//  HomepageViewControllerExtC.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 6/26/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import UIKit

extension HomepageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Not implemented; sample code only
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Not implemented; sample code only
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "spotlightPanelCollectionViewCell", for: indexPath) as! SpotlightPanelCollectionViewCell
        cell.decorate()
        cell.spotlightItem = SpotlightDetailHandler.activeSpotlightDetailViewHandler.spotlightItems.first!
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Not implemented; sample code only
        let spotlightItem = SpotlightDetailHandler.activeSpotlightDetailViewHandler.spotlightItems[indexPath[1]]
        SpotlightDetailHandler.viewSpotlightItemContent(viewController: self, spotlightItem: spotlightItem)
    }
    
}
