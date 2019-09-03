//
//  ADGApi.swift
//  Events Admin
//
//  Created by Sarvad shetty on 9/3/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import Foundation

enum NetworkEnvironment{
    case attendance
    case food
}

public enum ADGApi{
    case attendance(id:String)
    case food(id:String)
}

//or

//public enum ADGApi{
//    case attendance()
//    case food()
//}

extension ADGApi: EndPointType{
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .attendance: return "https://adg-events.herokuapp.com/"
        case .food: return "https://adg-events.herokuapp.com/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .attendance( _):
            return "/attendance"
        case .food(id: _):
            return "/food"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .post
    }
    
    var task: HTTPTask {
        switch self {
        case .attendance(id: let id):
            return .requestParameters(bodyParameter: ["regno":id], urlParameters: nil)
        case .food(id: let id):
            return .requestParameters(bodyParameter: ["regno":id], urlParameters: nil)
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}

