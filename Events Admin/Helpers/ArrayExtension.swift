//
//  ArrayExtension.swift
//  Events Admin
//
//  Created by Sarvad shetty on 9/3/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import Foundation

extension Array {
    /// Move the last element of the array to the beginning
    ///  - Returns: The element that was moved
    mutating func rotate() -> Element? {
        guard let lastElement = popLast() else {
            return nil
        }
        insert(lastElement, at: 0)
        return lastElement
    }
}
