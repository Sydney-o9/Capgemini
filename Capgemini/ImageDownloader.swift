/**
 *  ImageDownloader.swift
 *
 *  Created by Anthony Rey <anthony.rey21@gmail.com>
 *  Copyright © 2018 Capgemini Consulting. All rights reserved.
 */

import Foundation
import UIKit

private let maxCacheImageSize = 20

class ImageDownloader: NSObject {
    
    var imageCache = [String: UIImage]()
    
    func cacheImage(image: UIImage, forURL url: String) {
        if imageCache.count > maxCacheImageSize {
            imageCache.remove(at: imageCache.startIndex)
        }
        imageCache[url] = image
    }
    
    func cachedImageForURL(url: String) -> UIImage? {
        return imageCache[url]
    }
    
    func clearCache() { imageCache.removeAll() }
    
    func downloadImageFromURL(_ urlString: String, completion: ((_ success: Bool, _ image: UIImage?) -> Void)?) {
        
        /** Checks whether the image is cached already */
        if let cachedImage = cachedImageForURL(url: urlString) {
            DispatchQueue.main.async(execute: {completion?(true, cachedImage) })
        } else if let url = URL(string: urlString) {
            /** Download image from URL asynchronously otherwise */
            let session = URLSession.shared
            let downloadTask = session.downloadTask(with: url, completionHandler: { (retrievedURL, response, error) -> Void in
                var found = false
                if error != nil { print("-> [ERROR] Could not download image \(url.absoluteString): \(error!.localizedDescription)") }
                else if retrievedURL != nil {
                    if let data = try? Data(contentsOf: retrievedURL!) {
                        if let image = UIImage(data: data) {
                            found = true
                            self.cacheImage(image: image, forURL: url.absoluteString)
                            DispatchQueue.main.async(execute: { completion?(true, image) });
                        }
                    }
                }
                if !found { DispatchQueue.main.async(execute: { completion?(false, nil) }); }
            })
            downloadTask.resume()
        } else { completion?(false, nil) }
    }
    
}
