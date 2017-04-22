
//  AppDelegate.swift
//  Tree
//
//  Created by Shaps Benkau on 04/21/2017.
//  Copyright (c) 2017 Shaps Benkau. All rights reserved.
//

import UIKit
import Tree

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        guard let parent = window?.rootViewController else { return true }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            _ = parent.flattened[5].has(mask: .visible)
        }
        
        return true
    }

}

final class TabBarController: UITabBarController { }
final class FirstNavigationController: UINavigationController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.view.alpha = 0
    }
}
final class SecondNavigationController: UINavigationController { }
final class FirstViewController: UIViewController { }
final class SecondViewController: UITableViewController { }
final class NoParentViewController: UIViewController { }
