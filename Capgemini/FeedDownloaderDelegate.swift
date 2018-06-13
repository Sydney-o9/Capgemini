/**
 *  FeedDownloaderDelegate.swift
 *
 *  Created by Anthony Rey <anthony.rey21@gmail.com>
 *  Copyright © 2018 Capgemini Consulting. All rights reserved.
 */

import UIKit

protocol FeedDownloaderDelegate: class {
    func didFinishDownloadingFeed(_ sender: FeedDownloader)
}
