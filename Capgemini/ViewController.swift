/**
 *  ViewController.swift
 *
 *  Created by Anthony Rey <anthony.rey21@gmail.com>
 *  Copyright © 2018 Capgemini Consulting. All rights reserved.
 */

import UIKit

class ViewController: UIViewController {
    
    // MARK:  - Properties
    
    var feedDownloader: FeedDownloader?

    // MARK:  - UIViewController
    
    /**
     * Called after the controller's view is loaded into memory.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedDownloader = FeedDownloader(feedURL: CapgeminiApi.feedURL)
        feedDownloader?.downloadFeed()
    }
    
    /**
     * Notifies the view controller that its view was added to a view hierarchy.
     */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

