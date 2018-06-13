/**
 *  Story.swift
 *
 *  Created by Anthony Rey <anthony.rey21@gmail.com>
 *  Copyright © 2018 Capgemini Consulting. All rights reserved.
 */

struct Story: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case title
        case desc = "description"
        case imageHref
    }
    
    let title: String?
    let desc: String?
    let imageHref: String?
    
    func getString() -> String {
        return "Title: \(String(describing: title)), Description: \(String(describing: desc)), ImageHref: \(String(describing: imageHref))"
    }
}
