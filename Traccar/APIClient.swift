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
        Alamofire.request(endpoint.url, method: .get, parameters: nil)
            .validate()
            .responseJSON { (response) -> Void in
                
                guard response.result.isSuccess else {
                    if let error = response.result.error {
                        print("Error while fetching: \(error)")
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
                                if let error = response.result.error {
                                    print("Error while fetching: \(error)")
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
}
