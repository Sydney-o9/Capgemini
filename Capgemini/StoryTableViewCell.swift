/**
 *  StoryTableViewCell.swift
 *
 *  Created by Anthony Rey <anthony.rey21@gmail.com>
 *  Copyright © 2018 Capgemini Consulting. All rights reserved.
 */

import UIKit

class StoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var storyImageView: UIImageView!
    @IBOutlet weak var storyTitleLabel: UILabel!
    @IBOutlet weak var storyDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        storyDescriptionLabel?.numberOfLines = 0
        storyDescriptionLabel?.lineBreakMode = .byWordWrapping;
    }
    
}
