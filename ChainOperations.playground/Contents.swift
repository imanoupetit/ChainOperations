//
//  SequenceTypeExtension.swift
//  MoocUp-Admin
//
//  Created by Imanou PETIT on 07/10/2015.
//  Copyright © 2015 Imanou PETIT. All rights reserved.
//

import UIKit
import XCPlayground

extension CollectionType where Generator.Element == NSOperation {

    func chainDependencies() {
        for index in self.indices {
            if index.successor() != endIndex {
                self[index.successor()].addDependency(self[index])
            }
        }
    }
    
}

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

// Usage

let op0 = NSBlockOperation { print("0") }
let op1 = NSBlockOperation { print("1") }
let op2 = NSBlockOperation { print("2") }
let op3 = NSBlockOperation { print("3") }

[op0, op1, op2, op3].chainDependencies()

let queue = NSOperationQueue()
queue.addOperations([op0, op1, op2, op3], waitUntilFinished: false)
