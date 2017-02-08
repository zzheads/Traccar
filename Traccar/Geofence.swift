//
//  Geofence.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation

//Geofence
//
//Property	Type
//area	string
//attributes
//description	string
//id	integer
//name	string

class Geofence: JSONDecodable {
    let area: String
    let attributes: [AttributeAlias]
    let description: String
    let id: Int
    let name: String
    
    required init?(with json: JSON) {
        guard
            let area = json["area"] as? String,
            let attributesJson = json["attributes"] as? [JSON],
            let attributes = [AttributeAlias](with: attributesJson),
            let description = json["description"] as? String,
            let id = json["id"] as? Int,
            let name = json["name"] as? String
            else {
                return nil
        }
        self.area = area
        self.attributes = attributes
        self.description = description
        self.id = id
        self.name = name
    }
}
