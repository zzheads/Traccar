//
//  Endpoint.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation
import Alamofire

protocol Endpoint {
    var baseURL: URL { get }
    var path: String { get }
    var url: URL { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
    var request: DataRequest { get }
}

enum TraccarEndpoint: Endpoint {

    case server
    case devices(device: Device?)
    
    var baseURL: URL {
        return URL(string: "http://demo.traccar.org/api/")!
    }
    
    var path: String {
        switch self {
        case .server:
            return "server"
        case .devices:
            return "devices"
        }
    }
    
    var url: URL {
        let url = URL(string: self.path, relativeTo: self.baseURL)!
        return url
    }
    
    var method: HTTPMethod {
        switch self.parameters {
        case .none: return .get
        case .some: return .post
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .server: return nil
        case .devices(let device): return device?.parameters
        }
    }
    
    var encoding: ParameterEncoding {
        switch self.parameters {
        case .none: return URLEncoding.default
        case .some: return JSONEncoding.default
        }
    }
    
    var request: DataRequest {
        let request = Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: nil)
        return request
    }
}
