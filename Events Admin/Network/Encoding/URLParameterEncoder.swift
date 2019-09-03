//
//  URLParameterEncoder.swift
//  Events Admin
//
//  Created by Sarvad shetty on 9/2/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import Foundation

public struct URLParameterEncoder: ParameterEncoder {
    public static  func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        
        guard let url = urlRequest.url else { throw NetworkError.missingURL }
        
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
            //!parameters.isEmpty to make sure parameters isnt empty and make it true so if can pass
            urlComponents.queryItems = [URLQueryItem]()
            //append query
            for (key,value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                urlComponents.queryItems?.append(queryItem)
            }
            urlRequest.url = urlComponents.url
        }
        
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }
    }
}
