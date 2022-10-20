//
//  AppDelegate.swift
//  OpenTweet
//
//  Created by Olivier Larivain on 9/30/16.
//  Copyright © 2016 OpenTable, Inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = configureRootController()
        self.window?.makeKeyAndVisible()
        return true
    }
    
    private func configureRootController() -> UIViewController {
        let timelineViewController = TimelineViewController()
        let navigationController = UINavigationController(rootViewController: timelineViewController)
        return navigationController
    }
    
}

