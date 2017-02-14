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
        return "stalien@yandex.ru"
    }
    var PASSWORD: String {
        return "sw0rdf1sh"
    }
    
    case server
    case devices(id: Int?, Device?)
    case deleteDevice(id: Int)
    case commandTypes(id: Int)
    case events(id: Int)
    case geofences
    case groups
    case positions
    case notifications
    case users
    case session(email: String?, password: String?)
    case summaryReport(deviceIds: [Int], from: String, to: String)
    
    var baseURL: URL {
        return URL(string: "http://demo2.traccar.org/api/")!
    }
    
    var path: String {
        var path: String
        switch self {
        case .server: path = "server"
        case .devices, .deleteDevice: path = "devices"
        case .commandTypes: path = "commandtypes"
            
        case .events: path = "events"
        case .geofences: path = "geofences"
        case .groups: path = "groups"
        case .positions: path = "positions"
        case .notifications: path = "users/notifications"
        case .users: path = "users"
        case .session: path = "session"
        case .summaryReport: path = "reports/summary"
        }
        if let id = self.id {
            path += "/\(id)"
        }
        if let queryString = self.queryString {
            path += "?query=\(queryString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed))"
        }
        return path
    }
    
    var queryString: String? {
        switch self {
        case .commandTypes(let id): return "deviceId=\(id)"
        case .summaryReport(let deviceIds, let from, let to): return "deviceId=\(deviceIds)&from=\(from)&to=\(to)"
        default: return nil
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
        case .events(let id): return id
        default: return nil
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .devices(_, let device): return device?.parameters
        case .session(let email, let password):
            guard let email = email, let password = password else { return nil }
            return ["email": email, "password": password]
        default: return nil
        }
    }
    
    var encoding: ParameterEncoding {
        if let _ = self.queryString { return URLEncoding.queryString }
        if let _ = self.httpBody { return URLEncoding.httpBody }
        return URLEncoding.default
    }

    var httpBody: Data? {
        switch self {
        case .session(let email, let password):
            guard let email = email, let password = password else {
                return nil
            }
            let post = "email=\(email)&password=\(password)"
            return post.data(using: String.Encoding.ascii, allowLossyConversion: true)
        default: return nil
        }
    }
    
    var headers: HTTPHeaders? {
        var headers = ["Accept": "application/json"]
        if let httpBody = httpBody {
            headers["Content-Type"] = "application/x-www-form-urlencoded"
            headers["Content-Length"] = "\(httpBody.count)"
        } else {
            headers["Content-Type"] = "application/json"
        }
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
