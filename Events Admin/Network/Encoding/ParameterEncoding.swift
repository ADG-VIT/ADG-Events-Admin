//
//  ParameterEncoding.swift
//  Events Admin
//
//  Created by Sarvad shetty on 9/2/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import Foundation

public typealias Parameters = [String:Any]

//INOUT is a Swift keyword that defines an argument as a reference argument. Usually, variables are passed to functions as value types.
public protocol ParameterEncoder{
    static func encode(urlRequest: inout URLRequest, with parameters:Parameters) throws
}

public enum NetworkError: String, Error{
    case parametersNil = "Parameters were nil"
    case encodingFailed = "Parameter encoding failed"
    case missingURL = "URL is nil"
}
