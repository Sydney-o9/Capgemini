/**
 *  Feed.swift
 *
 *  Created by Anthony Rey <anthony.rey21@gmail.com>
 *  Copyright © 2018 Capgemini Consulting. All rights reserved.
 */

struct Feed: Codable {
    let title: String
    var stories: [Story]
    
    init(title: String, stories: [Story] = [Story]()) {
        self.title = title
        self.stories = stories
    }
    
    mutating func addStory(story: Story) {
        stories.append(story)
    }
    
    private enum CodingKeys: String, CodingKey {
        case title
        case stories = "rows"
    }
    
    func getString() -> String {
        return "Title: \(title), Stories: \(String(describing: stories))"
    }
}

