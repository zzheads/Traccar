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
