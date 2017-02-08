//
//  Device.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation

//Device
//
//Property	Type
//attributes
//category	string
//contact	string
//geofenceIds	array
//groupId	integer
//id	integer
//lastUpdate	string (date-time)
//model	string
//name	string
//phone	string
//positionId	integer
//status	string
//uniqueId	string

class Device: JSONDecodable {
    let attributes: [AttributeAlias]
    let category: String
    let contact: String
    let geofenceIds: [Int]
    let groupId: Int
    let id: Int
    let lastUpdate: String
    let model: String
    let name: String
    let phone: String
    let positionId: Int
    let status: String
    let uniqueId: String
    
    required init?(with json: JSON) {
        guard
            let attributesJson = json["attributes"] as? [JSON],
            let attributes = [AttributeAlias](with: attributesJson),
            let category = json["category"] as? String,
            let contact = json["contact"] as? String,
            let geofenceIds = json["geofenceIds"] as? [Int],
            let groupId = json["groupId"] as? Int,
            let id = json["id"] as? Int,
            let lastUpdate = json["lastUpdate"] as? String,
            let model = json["model"] as? String,
            let name = json["name"] as? String,
            let phone = json["phone"] as? String,
            let positionId = json["positionId"] as? Int,
            let status = json["status"] as? String,
            let uniqueId = json["uniqueId"] as? String
            else {
                return nil
        }
        self.attributes = attributes
        self.category = category
        self.contact = contact
        self.geofenceIds = geofenceIds
        self.groupId = groupId
        self.id = id
        self.lastUpdate = lastUpdate
        self.model = model
        self.name = name
        self.phone = phone
        self.positionId = positionId
        self.status = status
        self.uniqueId = uniqueId
    }
}
