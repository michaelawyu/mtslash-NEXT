//
//  HomepageViewControllerExtB.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 6/22/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import UIKit

extension HomepageViewController {
    
    func slidingMenuButtonPressed(sender : SlidingMenuButton) {
        if sender.menuItemOrder == slidingMenuButtons.endIndex {
            return
        } else {
            
            // Generate new background image and alpha values
            let (backgroundImage, alphaForMask, alphaForImage) = HomepageBackgroundImageHandler.activeHomepageBackgroundImageHandler.getHomepageBackgroundImage(sender: sender)
            
            // Fade out subtitle of sliding menu
            UIView.animate(withDuration: 0.8, animations: {
                self.slidingMenuSubtitleLabel.alpha = 0.0
            }, completion: { (ifCompleted) in
                // Update and reveal subtitle of sliding menu
                
                // Set text color of label
                if alphaForMask == 0.0 {
                    self.slidingMenuSubtitleLabel.textColor = UIColor.black
                } else {
                    self.slidingMenuSubtitleLabel.textColor = UIColor.white
                }
                
                // Reveal subtitle
                UIView.animate(withDuration: 0.6, animations: {
                    self.slidingMenuSubtitleLabel.alpha = 1.0
                })
            })
            
            // Fade out viewReadingList and search buttons
            UIView.animate(withDuration: 0.1, animations: {
                self.viewReadingListButton.alpha = 0.0
                self.searchButton.alpha = 0.0
            }, completion: { (ifCompleted) in
                // Update and reveal buttons
                
                // Set colors
                if alphaForMask == 0.0 {
                    self.viewReadingListButton.tintColor = UIColor.darkGray
                    self.searchButton.tintColor = UIColor.darkGray
                } else {
                    self.viewReadingListButton.tintColor = UIColor.lightText
                    self.searchButton.tintColor = UIColor.lightText
                }
                
                // Reveal buttons
                UIView.animate(withDuration: 0.5, animations: {
                    self.viewReadingListButton.alpha = 1.0
                    self.searchButton.alpha = 1.0
                })
            })
            
            // Move out all buttons in the sliding menu
            for i in 0..<slidingMenuButtons.endIndex {
                
                let button = slidingMenuButtons[i]
                UIView.animate(withDuration: 0.8, delay: 0.05 * Double(i), usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: [], animations: {
                    button.transform = CGAffineTransform(translationX: 0.0, y: -100.0)
                    button.alpha = 0.0
                    
                }, completion: { (ifCompleted) in
                    
                    // Update and move in all buttons of the sliding menu when the last animation block is executed
                    if i == self.slidingMenuButtons.endIndex - 1 {
                        
                        // Select new text colors for buttons
                        let colorForMainButton = alphaForMask == 0.0 ? UIColor.black : UIColor.white
                        let colorForOtherButtons = alphaForMask == 0.0 ? UIColor.lightGray : UIColor.lightText
                        
                        // Refocus buttons
                        SlidingMenuHandler.activeSlidingMenuHandler.focusAt(index: sender.menuItemOrder)
                        self.updateSlidingMenuButtons()
                        
                        for j in 0..<self.slidingMenuButtons.endIndex {
                            let button = self.slidingMenuButtons[j]
                            
                            // Set text color for button
                            j != self.slidingMenuButtons.endIndex - 1 ? button.setTitleColor(colorForOtherButtons, for: UIControlState.normal) : button.setTitleColor(colorForMainButton, for: UIControlState.normal)
                            
                            // Move in all buttons
                            UIView.animate(withDuration: 0.6, delay: 0.05 * Double(j), usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: [], animations: {
                                button.transform = CGAffineTransform(translationX: 0.0, y: 0.0)
                                button.alpha = 1.0
                            }, completion: nil)
                        }
                    }
                })
            }
            
            // Set up background
            UIView.animate(withDuration: 1.2, animations: {
                    self.homepageBackgroundMaskImageView.alpha = CGFloat(alphaForMask)
                })
                
            UIView.animate(withDuration: 0.4, animations: {
                self.homepageBackgroundImageView.alpha = 0.0
            }, completion: { (ifCompleted) in
                self.homepageBackgroundImageView.image = backgroundImage
                UIView.animate(withDuration: 0.8, animations: {
                    self.homepageBackgroundImageView.alpha = CGFloat(alphaForImage)
                })
            })
            
        }
    }
}
