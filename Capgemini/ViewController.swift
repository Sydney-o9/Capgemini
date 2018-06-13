/**
 *  ViewController.swift
 *
 *  Created by Anthony Rey <anthony.rey21@gmail.com>
 *  Copyright © 2018 Capgemini Consulting. All rights reserved.
 */

import UIKit

class ViewController: UIViewController {
    
    // MARK:  - IBOutlets
    
    @IBOutlet var tableView: UITableView!
    
    // MARK:  - Properties
    
    var feedDownloader: FeedDownloader?
    
    var tableData: [Story] = []

    // MARK:  - UIViewController
    
    /**
     * Called after the controller's view is loaded into memory.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        
        feedDownloader = FeedDownloader(feedURL: CapgeminiApi.feedURL)
        feedDownloader?.delegate = self
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

extension ViewController: FeedDownloaderDelegate {
    
    func didFinishDownloadingFeed(_ sender: FeedDownloader) {
        print("-> Finished downloading from remote server.")
        print("Decoded Feed Struct: " + (feedDownloader?.decodedFeed?.getString())!)
        
        if let title = feedDownloader?.decodedFeed?.title {
            self.title = title
        }
        
        if let stories = feedDownloader?.decodedFeed?.stories {
            self.tableData = stories.filter { $0.title?.isEmpty == false }
            self.tableView.reloadData()
        }

    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("Dequeing cell \(indexPath.row)")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCellIdentifier", for: indexPath) as! StoryTableViewCell
        let story: Story = self.tableData[indexPath.row]
        
        if let title = story.title {
            cell.storyTitleLabel?.text = title
        }
        
        if let description = story.desc {
            cell.storyDescriptionLabel?.textColor = UIColor.black
            cell.storyDescriptionLabel?.text = description
        } else {
            cell.storyDescriptionLabel?.textColor = UIColor.gray
            cell.storyDescriptionLabel?.text = "No description for this story"
        }
        
        return cell
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}

