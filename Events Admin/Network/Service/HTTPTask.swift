//
//  HTTPTask.swift
//  Events Admin
//
//  Created by Sarvad shetty on 9/2/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import Foundation

public enum HTTPTask {
    case request
    case requestParameters(bodyParameter:Parameters?,urlParameters:Parameters?)
    case requestParametersAndHeaders(bodyParameter:Parameters?,urlParameters:Parameters?,additionHeaders:HTTPHeaders?)
    
    //case for download task
}

public typealias HTTPHeaders = [String:String]
