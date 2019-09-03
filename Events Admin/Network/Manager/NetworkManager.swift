//
//  NetworkManager.swift
//  Events Admin
//
//  Created by Sarvad shetty on 9/3/19.
//  Copyright © 2019 Sarvad shetty. All rights reserved.
//

import Foundation

enum NetworkResponse:String {
    case success
    case authenticationError = "student has not registered for the event"
    case badRequest = "bad request"
    case attendanceMarked = "attendance marked"
    case foodMark = "ok refreshments to be given to the participant"
    case served = "refreshments already served"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String> {
    case success
    case failure(String)
}

struct NetworkManager{
    static let environment:NetworkEnvironment = .attendance
    private let route = Router<ADGApi>()
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
        switch response.statusCode {
        case 200: return .success
        case 208: return .failure(NetworkResponse.served.rawValue)
        case 400: return .failure(NetworkResponse.badRequest.rawValue)
        case 401: return .failure(NetworkResponse.authenticationError.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
    
    func setAttendance(id:String, completion:@escaping(_ error:String?,_ res:String?)->()){
        route.request(.attendance(id:id)) { data, response, error in
            
            if error != nil {
                completion("Please check your network connection.", nil)
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(NetworkResponse.noData.rawValue, nil)
                        return
                    }
                    
                    print(responseData)
                    completion(nil,"Done")
//                    do {
//                        print(responseData)
//                        completion(nil,"Done")
////                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
////                        print(jsonData)
////                        let apiResponse = try JSONDecoder().decode(MovieApiResponse.self, from: responseData)
////                        completion(apiResponse.movies,nil)
//                    }catch {
//                        print(error)
//                        completion(NetworkResponse.unableToDecode.rawValue, nil)
//                    }
                case .failure(let networkFailureError):
                    completion(networkFailureError, nil)
                }
            }
        }
    }
    
    func setFood(id:String, completion:@escaping(_ error:String?,_ res:String?)->()){
        route.request(.food(id:id)) { data, response, error in
            
            if error != nil {
                completion("Please check your network connection.", nil)
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(NetworkResponse.noData.rawValue, nil)
                        return
                    }
                    
                    print(responseData)
                    completion(nil,"Done")
                    //                    do {
                    //                        print(responseData)
                    //                        completion(nil,"Done")
                    ////                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                    ////                        print(jsonData)
                    ////                        let apiResponse = try JSONDecoder().decode(MovieApiResponse.self, from: responseData)
                    ////                        completion(apiResponse.movies,nil)
                    //                    }catch {
                    //                        print(error)
                    //                        completion(NetworkResponse.unableToDecode.rawValue, nil)
                //                    }
                case .failure(let networkFailureError):
                    completion(networkFailureError, nil)
                }
            }
        }
    }

    
//    func getNewMovies(page: Int, completion: @escaping (_ movie: [Movie]?,_ error: String?)->()){
//        router.request(.newMovies(page: page)) { data, response, error in
//
//            if error != nil {
//                completion(nil, "Please check your network connection.")
//            }
//
//            if let response = response as? HTTPURLResponse {
//                let result = self.handleNetworkResponse(response)
//                switch result {
//                case .success:
//                    guard let responseData = data else {
//                        completion(nil, NetworkResponse.noData.rawValue)
//                        return
//                    }
//                    do {
//                        print(responseData)
//                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
//                        print(jsonData)
//                        let apiResponse = try JSONDecoder().decode(MovieApiResponse.self, from: responseData)
//                        completion(apiResponse.movies,nil)
//                    }catch {
//                        print(error)
//                        completion(nil, NetworkResponse.unableToDecode.rawValue)
//                    }
//                case .failure(let networkFailureError):
//                    completion(nil, networkFailureError)
//                }
//            }
//        }
//    }
}





