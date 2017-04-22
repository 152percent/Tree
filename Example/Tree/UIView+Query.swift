//
//  UIView+Query.swift
//  UIQueryKit
//
//  Created by Shahpour Benkau on 21/04/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

extension UIView {
    public struct QueryMask: OptionSet {
        public let rawValue: Int
        public init(rawValue: Int) { self.rawValue = rawValue }
        
        public static let visible = QueryMask(rawValue: 1 << 0)
        public static let container = QueryMask(rawValue: 1 << 1)
        public static let leaf = QueryMask(rawValue: 1 << 2)
    }
    
    public func has(mask: QueryMask) -> Bool {
        if mask.contains(.visible) && (window == nil || alpha == 0 || isHidden || frame == .zero ||
            (superview?.bounds.intersects(frame) == false && superview?.clipsToBounds == true)) {
            return false
        }
        
        if mask.contains(.container) && subviews.count == 0 {
            return false
        }
        
        if mask.contains(.leaf) && subviews.count > 0 {
            return false
        }
        
        return true
    }
}
