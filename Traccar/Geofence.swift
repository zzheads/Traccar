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

class Geofence: JSONDecodable, PrettyPrintable {
    let area: String
    let attributes: JSON
    let description: String
    let id: Int
    let name: String
    
    required init?(with json: JSON) {
        guard
            let area = json["area"] as? String,
            let attributes = json["attributes"] as? JSON,
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
