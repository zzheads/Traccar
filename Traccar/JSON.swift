//
//  JSON.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation

typealias JSON = [String: AnyObject]
typealias JSONArray = [JSON]

typealias JSONTaskCompletion = (JSON?, HTTPURLResponse?, Error?) -> Void
typealias JSONArrayTaskCompletion = (JSONArray?, HTTPURLResponse?, Error?) -> Void
typealias TaskCompletion<J> = (J?, HTTPURLResponse?, Error?) -> Void

typealias JSONTask = URLSessionDataTask
typealias URLSessionDataTaskCompletion = (Data?, URLResponse?, Error?) -> Void

protocol JSONDecodable: class {
    init?(with json: JSON)
}

typealias Parse<J, T: JSONDecodable> = ((J) -> T?) where T: JSONDecodable

extension JSONDecodable {
    static var parse: Parse<JSON, Self> {
        return { (json: JSON) in
            return Self.init(with: json)
        }
    }
}

extension Array where Element: JSONDecodable {
    init?(with jsonArray: JSONArray) {
        self.init()
        for json in jsonArray {
            if let value = Element.init(with: json) {
                self.append(value)
            } else {
                return nil
            }
        }
    }
    
    static var parse: Parse<JSONArray, Array> {
        return { (jsonArray: JSONArray) in
            return Array.init(with: jsonArray)
        }
    }
}
