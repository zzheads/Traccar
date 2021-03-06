//
//  APIClient.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {

    static func failureHandler<T>(completion: @escaping (T?) -> Void) -> (DataResponse<Any>) -> Void {
        return { (response: DataResponse<Any>) in
            let statusCode = HTTPStatusCode(rawValue: (response.response?.statusCode)!)
            if let error = response.result.error {
                print("Error while fetching: \(error) \(APIError.httpResponseStatusCodeError(statusCode!).localizedDescription)")
            } else {
                print("Unknown error while fetching")
            }
            completion(nil)
        }
    }
    
    func get<T: JSONDecodable>(endpoint: Endpoint, completion: @escaping (T?) -> Void) {
        endpoint.request.responseJSON { (response) -> Void in
            guard response.result.isSuccess else {
                APIClient.failureHandler(completion: completion)(response)
                return
            }
            
            guard
                let json = response.result.value as? JSON,
                let value = T(with: json)
                else {
                    APIClient.failureHandler(completion: completion)(response)
                    return
            }
            completion(value)
            return
        }
    }
    
    func getArray<T: JSONDecodable>(endpoint: Endpoint, completion: @escaping ([T]?) -> Void) {
        endpoint.request.responseJSON { (response) -> Void in
            guard response.result.isSuccess else {
                APIClient.failureHandler(completion: completion)(response)
                return
            }
            
            guard
                let jsonArray = response.result.value as? JSONArray,
                let values = [T](with: jsonArray)
                else {
                    APIClient.failureHandler(completion: completion)(response)
                    return
            }
            completion(values)
            return
        }
    }

    func delete(endpoint: Endpoint, completion: @escaping (DataResponse<Any>) -> Void) {
        endpoint.request.responseJSON { (response) -> Void in
            completion(response)
        }
    }
}
