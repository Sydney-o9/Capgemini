/**
 *  AppDelegate.swift
 *
 *  Created by Anthony Rey <anthony.rey21@gmail.com>
 *  Copyright © 2018 Capgemini Consulting. All rights reserved.
 */

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    /**
     * Override point for customization after application launch.
     */
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Allow full-display of the splash screen for 2.0 seconds
        Thread.sleep(forTimeInterval: 2.0)
        
        return true
    }
    
    /**
     * Sent when the application is about to move from active to inactive state.
     *
     * Eg. This can occur for certain types of temporary interruptions (such as an incoming phone call or
     * SMS message) or when the user quits the application and it begins the transition to the background
     * state.
     */
    func applicationWillResignActive(_ application: UIApplication) {
        // no-op
    }

    /**
     * Use this method to release shared resources, save user data, invalidate timers, and store enough
     * application state information to restore your application to its current state in case it is
     * terminated later.
     *
     * If the application supports background execution, this method is called instead of
     * `applicationWillTerminate:` when the user quits.
     */
    func applicationDidEnterBackground(_ application: UIApplication) {
        // no-op
    }

    /**
     * Called as part of the transition from the background to the inactive state; here we
     * can undo many of the changes made on entering the background.
     */
    func applicationWillEnterForeground(_ application: UIApplication) {
        // no-op
    }

    /**
     * Restart any tasks that were paused (or not yet started) while the application was
     * inactive. If the application was previously in the background, optionally refresh
     * the user interface.
     */
    func applicationDidBecomeActive(_ application: UIApplication) {
        // no-op
    }

    /**
     * Called when the application is about to terminate. Save data if appropriate.
     * See also applicationDidEnterBackground:.
     */
    func applicationWillTerminate(_ application: UIApplication) {
        // no-op
    }


}

