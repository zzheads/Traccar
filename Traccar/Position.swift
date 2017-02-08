//
//  Position.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation

//Position
//
//Property	Type	Description
//address	string
//altitude	number
//attributes
//course	number
//deviceId	integer
//deviceTime	string (date-time)
//fixTime	string (date-time)
//id	integer
//latitude	number
//longitude	number
//outdated	boolean
//protocol	string
//serverTime	string (date-time)
//speed	number	In knots
//valid	boolean

class Position: JSONDecodable {
    let address: String
    let altitude: Double
    let attributes: [AttributeAlias]
    let course: Double
    let deviceId: Int
    let deviceTime: String
    let fixTime: String
    let id: Int
    let latitude: Double
    let longitude: Double
    let outdated: Bool
    let _protocol: String
    let serverTime: String
    let speed: Double
    let valid: Bool
    
    required init?(with json: JSON) {
        guard
            let address = json["address"] as? String,
            let altitude = json["altitude"] as? Double,
            let attributesJson = json["attributes"] as? [JSON],
            let attributes = [AttributeAlias](with: attributesJson),
            let course = json["course"] as? Double,
            let deviceId = json["deviceId"] as? Int,
            let deviceTime = json["deviceTime"] as? String,
            let fixTime = json["fixTime"] as? String,
            let id = json["id"] as? Int,
            let latitude = json["latitude"] as? Double,
            let longitude = json["longitude"] as? Double,
            let outdated = json["outdated"] as? Bool,
            let _protocol = json["protocol"] as? String,
            let serverTime = json["serverTime"] as? String,
            let speed = json["speed"] as? Double,
            let valid = json["valid"] as? Bool
            else {
                return nil
        }
        self.address = address
        self.altitude = altitude
        self.attributes = attributes
        self.course = course
        self.deviceId = deviceId
        self.deviceTime = deviceTime
        self.fixTime = fixTime
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.outdated = outdated
        self._protocol = _protocol
        self.serverTime = serverTime
        self.speed = speed
        self.valid = valid
    }
}
