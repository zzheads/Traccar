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
}

enum TraccarEndpoint: Endpoint {

    case server
    
    var baseURL: URL {
        return URL(string: "http://demo.traccar.org/api/")!
    }
    
    var path: String {
        switch self {
        case .server:
            return "server"
        }
    }
    
    var url: URL {
        let url = URL(string: self.path, relativeTo: self.baseURL)!
        return url
    }
}
