//
//  Event.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation

//Event
//
//Property	Type
//attributes
//deviceId	integer
//geofenceId	integer
//id	integer
//positionId	integer
//serverTime	string (date-time)
//type	string

class Event: JSONDecodable {
    let attributes: [AttributeAlias]
    let deviceId: Int
    let geofenceId: Int
    let id: Int
    let positionId: Int
    let serverTime: String
    let type: String
    
    required init?(with json: JSON) {
        guard
            let attributesJson = json["attributes"] as? [JSON],
            let attributes = [AttributeAlias](with: attributesJson),
            let deviceId = json["deviceId"] as? Int,
        let geofenceId = json["geofenceId"] as? Int,
        let id = json["id"] as? Int,
        let positionId = json["positionId"] as? Int,
        let serverTime = json["serverTime"] as? String,
        let type = json["type"] as? String
            else {
                return nil
        }
        self.attributes = attributes
        self.deviceId = deviceId
        self.geofenceId = geofenceId
        self.id = id
        self.positionId = positionId
        self.serverTime = serverTime
        self.type = type
    }
}
