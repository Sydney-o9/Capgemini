/**
 *  FeedDownloader.swift
 *
 *  Created by Anthony Rey <anthony.rey21@gmail.com>
 *  Copyright © 2018 Capgemini Consulting. All rights reserved.
 */

import Foundation

class FeedDownloader: NSObject {
    
    // MARK:  - Properties
    
    var feedURL: String?
    
    var jsonData: NSMutableData?
    
    var jsonString: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data as Data, encoding: .isoLatin1)
    }
    
    var decodedFeed: Feed?
    
    init(feedURL:String) {
        self.feedURL = feedURL
    }
    
    // MARK:  - Download Feed
    
    /**
     * Download Feed from Capgemini Api
     *
     * - Uses NSURLConnection
     */
    public func downloadFeed() {
        guard let feedUrl = URL(string: self.feedURL!) else { return }
        let request = URLRequest(url: feedUrl, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        let _ = NSURLConnection(request: request, delegate: self, startImmediately: true)
    }
    
}


extension FeedDownloader: NSURLConnectionDelegate, NSURLConnectionDataDelegate {
    
    /**
     * Sent when the connection has received sufficient data to construct the URL response for its
     * request.
     */
    func connection(_ connection: NSURLConnection, didReceive response: URLResponse) {
        self.jsonData = NSMutableData()
    }
    
    /**
     * Sent as a connection loads data incrementally.
     */
    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        self.jsonData?.append(data)
    }
    
    /**
     * Sent when a connection fails to load its request successfully.
     */
    func connection(_ connection: NSURLConnection, didFailWithError error: Error) {
        print("[ERROR] -> Connection Error \(error.localizedDescription)")
    }
    
    /**
     * Sent when a connection has finished loading successfully.
     */
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        
        guard let data = jsonString?.data(using: .utf8) else { return }
        
        do {
            self.decodedFeed = try Feed.decode(data: data)
        } catch {
            print("[ERROR] -> json error: \(error.localizedDescription)")
        }
        
    }
    
}
