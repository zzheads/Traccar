//
//  APIClient.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation
import Alamofire

class AlamoAPIClient {
    
    func fetch<T: JSONDecodable>(endpoint: Endpoint, completion: @escaping ([T]?) -> Void) {
        endpoint.request
            .authenticate(user: "zzheads@gmail.com", password: "xelaxela")
            .responseJSON { (response) -> Void in
                
                guard response.result.isSuccess else {
                    let statusCode = HTTPStatusCode(rawValue: (response.response?.statusCode)!)
                    if let error = response.result.error {
                        print("Error while fetching: \(error) \(APIError.httpResponseStatusCodeError(statusCode!).localizedDescription)")
                    } else {
                        print("Unknown error while fetching")
                    }
                    completion(nil)
                    return
                }
                
                guard
                    let json = response.result.value as? JSON,
                    let value = T(with: json)
                    else {
                        guard
                            let jsonArray = response.result.value as? JSONArray,
                            let values = [T](with: jsonArray)
                            else {
                                let statusCode = HTTPStatusCode(rawValue: (response.response?.statusCode)!)
                                if let error = response.result.error {
                                    print("Error while fetching: \(error) \(APIError.httpResponseStatusCodeError(statusCode!).localizedDescription)")
                                } else {
                                    print("Unknown error while fetching")
                                }
                                completion(nil)
                                return
                        }
                        completion(values)
                        return
                }
                completion([value])
        }
    }
    
    func send(endpoint: Endpoint, completion: @escaping (String?) -> Void) {
        endpoint.request
            .authenticate(user: "zzheads@gmail.com", password: "xelaxela")
            .responseString { (response) in
                guard response.result.isSuccess else {
                    let statusCode = HTTPStatusCode(rawValue: (response.response?.statusCode)!)
                    if let error = response.result.error {
                        print("Error while fetching: \(error) \(APIError.httpResponseStatusCodeError(statusCode!).localizedDescription)")
                    } else {
                        print("Unknown error while fetching")
                    }
                    completion(nil)
                    return
                }
                
                guard
                    let string = response.result.value
                    else {
                        let statusCode = HTTPStatusCode(rawValue: (response.response?.statusCode)!)
                        if let error = response.result.error {
                            print("Error while fetching: \(error) \(APIError.httpResponseStatusCodeError(statusCode!).localizedDescription)")
                        } else {
                            print("Unknown error while fetching")
                        }
                        completion(nil)
                        return
                }
                completion(string)
                return
        }
    }
}
