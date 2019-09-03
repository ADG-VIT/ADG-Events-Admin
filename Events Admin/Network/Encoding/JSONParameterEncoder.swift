//
//  JSONParameterEncoder.swift
//  Events Admin
//
//  Created by Sarvad shetty on 9/2/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import Foundation

public struct JSONParameterEncoder: ParameterEncoder {
    public static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonAsData  = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonAsData
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        }
        catch{
            throw NetworkError.encodingFailed
        }
    }
}
