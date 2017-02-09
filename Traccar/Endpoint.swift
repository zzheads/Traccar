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

    var USER: String {
        return "zzheads@gmail.com"
    }
    var PASSWORD: String {
        return "xelaxela"
    }
    
    case server
    case devices(id: Int?, Device?)
    case deleteDevice(id: Int)
    
    var baseURL: URL {
        return URL(string: "http://demo.traccar.org/api/")!
    }
    
    var path: String {
        switch self {
        case .server:
            return "server"
        case .devices(let id, _):
            guard let id = id else {
                return "devices"
            }
            return "devices/\(id)"
        case .deleteDevice(let id):
            return "devices/\(id)"
        }
    }
    
    var url: URL {
        let url = URL(string: self.path, relativeTo: self.baseURL)!
        return url
    }
    
    var method: HTTPMethod {
        switch self.parameters {
        case .none:
            if let _ = id {
                return .delete
            } else {
                return .get
            }
        case .some:
            if let _ = id {
                return .put
            } else {
                return .post
            }
        }
    }
    
    var id: Int? {
        switch self {
        case .devices(let id, _): return id
        case .deleteDevice(let id): return id
        default: return nil
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .devices(_, let device): return device?.parameters
        default: return nil
        }
    }
    
    var encoding: ParameterEncoding {
        switch self.parameters {
        case .none: return URLEncoding.default
        case .some: return JSONEncoding.default
        }
    }
    
    var headers: HTTPHeaders? {
        var headers = ["Accept": "application/json", "Content-Type": "application/json"]
        if let authorizationHeader = Request.authorizationHeader(user: USER, password: PASSWORD) {
            headers[authorizationHeader.key] = authorizationHeader.value
        }
        
        return headers
    }
    
    var request: DataRequest {
        let request = Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
        return request
    }
}
