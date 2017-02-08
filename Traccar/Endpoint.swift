//
//  Endpoint.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation

protocol Endpoint {
    var baseURL: URL { get }
    var path: String { get }
    var request: URLRequest { get }
    var url: URL { get }
}

enum TraccarEndpoint: Endpoint {
    
    case getAttributesAliases
    case postAttributesAliases(attributeAlias: AttributeAlias)
    
    enum HTTPMethod {
        case GET
        case POST
        case PUT
        case DELETE
    }
    
    var baseURL: URL {
        return URL(string: "http://traccar.org/api")!
    }
    
    var path: String {
        switch self {
        case .getAttributesAliases:
            return "/attributes/aliases"
        }
    }
    
}
