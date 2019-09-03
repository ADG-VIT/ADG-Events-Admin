//
//  Weak.swift
//  Events Admin
//
//  Created by Sarvad shetty on 9/3/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import Foundation

/// A box that allows us to weakly hold on to an object
struct Weak<Object: AnyObject> {
    weak var value: Object?
}
