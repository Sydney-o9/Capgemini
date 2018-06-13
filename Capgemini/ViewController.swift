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
    
    var imageDownloader: ImageDownloader?
    
    var tableData: [Story] = []
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(ViewController.handleRefresh(_:)),
                                 for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.gray
        
        return refreshControl
    }()

    // MARK:  - UIViewController
    
    /**
     * Called after the controller's view is loaded into memory.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.addSubview(self.refreshControl)
        
        tableView.rowHeight = 80
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        
        feedDownloader = FeedDownloader(feedURL: CapgeminiApi.feedURL)
        feedDownloader?.delegate = self
        feedDownloader?.downloadFeed()
        
        imageDownloader = ImageDownloader()
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
    
    // MARK:  - Refresh
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        feedDownloader?.downloadFeed()
        refreshControl.endRefreshing()
    }


}

extension ViewController: FeedDownloaderDelegate {
    
    func didFinishDownloadingFeed(_ sender: FeedDownloader) {
        print("-> [OK] Finished Feed download from remote server.")
        
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
        
        print("-> [OK] Dequeuing cell \(indexPath.row)")
        
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
        
        /** Update Image */
        cell.storyImageView.contentMode = .scaleAspectFit
        cell.storyImageView.image = UIImage(named: "DefaultStoryImage")
        guard let imageURL = story.imageHref else { return cell }
        imageDownloader?.downloadImageFromURL(imageURL) {
            (success, image) -> Void in
            if success && image != nil {
                if tableView.indexPath(for: cell)?.row == indexPath.row {
                    cell.storyImageView.image = image
                }
            }
        }
        
        return cell
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}

