//
//  NetworkRouter.swift
//  Events Admin
//
//  Created by Sarvad shetty on 9/2/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?) -> ()

protocol NetworkRouter: class{
    associatedtype EndPoint:EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}

//We make use of an associatedtype here as we want our Router to be able to handle any EndPointType. Without the use of associatedtype the router would have to have a concrete EndPointType
