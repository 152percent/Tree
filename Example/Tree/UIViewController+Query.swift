//
//  UIViewController+Query.swift
//  UIQueryKit
//
//  Created by Shahpour Benkau on 21/04/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

extension UIViewController {
    public struct QueryMask: OptionSet {
        public let rawValue: Int
        public init(rawValue: Int) { self.rawValue = rawValue }
        
        public static let visible = QueryMask(rawValue: 1 << 0)
        public static let container = QueryMask(rawValue: 1 << 1)
        public static let leaf = QueryMask(rawValue: 1 << 2)
        public static let presented = QueryMask(rawValue: 1 << 3)
        public static let presenting = QueryMask(rawValue: 1 << 4)
    }
    
    public func has(mask: QueryMask) -> Bool {
        if mask.contains(.visible) {
            if let tab = tabBarController, (tab.selectedViewController != self && tab.selectedViewController != parent) {
                return false
            }
            
            if let nav = navigationController, (nav.topViewController != self && nav.topViewController != parent) {
                return false
            }
            
            if !isViewLoaded || presentedViewController != nil || !view.has(mask: .visible) {
                return false
            }
        }
        
        if mask.contains(.container) && childViewControllers.count == 0 {
            return false
        }
        
        if mask.contains(.leaf) && childViewControllers.count != 0 {
            return false
        }
        
        if mask.contains(.presented) && (presentingViewController == nil || parent != nil) {
            return false
        }
        
        if mask.contains(.presenting) && (presentedViewController == nil || presentedViewController?.presentingViewController != self) {
            return false
        }
        
        return true
    }
    
    private var topController: UIViewController {
        if let controller = self as? UINavigationController {
            return controller.topViewController?.topController ?? controller
        }
        
        if let controller = self as? UITabBarController {
            return controller.selectedViewController?.topController ?? controller
        }
        
        return self
    }
}
