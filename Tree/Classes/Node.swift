//
//  Node.swift
//  Tree
//
//  Created by Shahpour Benkau on 21/04/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation

public protocol Node: class {
    associatedtype NodeType: Self
    var parent: NodeType? { get }
    var children: [NodeType] { get }
}

extension Node {
    public var isLeaf: Bool {
        return children.count == 0
    }
}
