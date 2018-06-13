/**
 *  CapgeminiTests.swift
 *
 *  Created by Anthony Rey <anthony.rey21@gmail.com>
 *  Copyright © 2018 Capgemini Consulting. All rights reserved.
 */

import XCTest
@testable import Capgemini

class CapgeminiTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testJSONMapping() throws {
        let bundle = Bundle(for: type(of: self))
        
        guard let url = bundle.url(forResource: "feed", withExtension: "json") else {
            XCTFail("Missing file: feed.json")
            return
        }
        let data = try Data(contentsOf: url)
        let feed: Feed? = try? Feed.decode(data: data)
        
        XCTAssertEqual(feed?.title, "About Canada")
        XCTAssertEqual(feed?.stories.count, 14)
        XCTAssertEqual(feed?.stories[0].title, "Beavers")
        XCTAssertEqual(feed?.stories[0].desc, "Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony")
        XCTAssertEqual(feed?.stories[0].imageHref, "http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg")

    }
    
}
