//
//  UIKit+Node.swift
//  Tree
//
//  Created by Shahpour Benkau on 21/04/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

extension UIViewController: Node {
    public var children: [UIViewController] {
        var children = childViewControllers
        
        if let controller = presentedViewController, controller.presentingViewController == self {
            children.append(controller)
        }
        
        return children
    }
    
    public var flattened: [UIViewController] {
        return [self] + children.flatMap { $0.flattened }
    }
    
    
    public func flattened(_ isIncluded: (UIViewController) throws -> Bool) rethrows -> [UIViewController] {
        return try flattened.filter(isIncluded)
    }
}

extension UIView: Node {
    public var parent: UIView? {
        return superview
    }
    
    public var children: [UIView] {
        return subviews
    }
    
    public var flattened: [UIView] {
        return [self] + children.flatMap { $0.flattened }
    }
}

extension CALayer: Node {
    public var parent: CALayer? {
        return superlayer
    }
    
    public var children: [CALayer] {
        return sublayers ?? []
    }
    
    public var flattened: [CALayer] {
        return [self] + children.flatMap { $0.flattened }
    }
    
}
