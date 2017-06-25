//
//  DocumentViewerHelper.swift
//  mtslash:NEXT
//
//  Created by Michael.A.W.Yu on 5/23/17.
//  Copyright © 2017 Michael.A.W.Yu. All rights reserved.
//

import Foundation
import UIKit

// A class for convenient web document viewer initiation
class DocumentViewerHelper {
    
    // A func for conveniently creating a UIViewController for viewing documents
    static func initDocumentViewer(viewController : UIViewController, URL: URL, title: String) {
        let documentViewer = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WebDocumentPageViewController") as! WebDocumentPageViewController
        documentViewer.modalPresentationStyle = UIModalPresentationStyle.popover
        viewController.present(documentViewer, animated: true, completion: nil)
        documentViewer.setDocumenterViewer(documentAddress: URL, title: title)
    }
}
