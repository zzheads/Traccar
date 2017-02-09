//
//  Server.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation

//Server
//
//Property	Type
//attributes
//bingKey	string
//coordinateFormat	string
//distanceUnit	string
//forceSettings	boolean
//id	integer
//latitude	number
//longitude	number
//map	string
//mapUrl	string
//readonly	boolean
//registration	boolean
//speedUnit	string
//twelveHourFormat	boolean
//version	string
//zoom	integer

class Server: JSONDecodable, PrettyPrintable {
    let attributes: JSON
    let bingKey: String
    let coordinateFormat: String?
    let distanceUnit: String
    let forceSettings: Bool
    let id: Int
    let latitude: Double
    let longitude: Double
    let map: String
    let mapUrl: String
    let readonly: Bool
    let registration: Bool
    let speedUnit: String
    let twelveHourFormat: Bool
    let version: String
    let zoom: Int
    
    required init?(with json: JSON) {
        guard
            let attributes = json["attributes"] as? JSON,
            let bingKey = json["bingKey"] as? String,
            let distanceUnit = json["distanceUnit"] as? String,
            let forceSettings = json["forceSettings"] as? Bool,
            let id = json["id"] as? Int,
            let latitude = json["latitude"] as? Double,
            let longitude = json["longitude"] as? Double,
            let map = json["map"] as? String,
            let mapUrl = json["mapUrl"] as? String,
            let readonly = json["readonly"] as? Bool,
            let registration = json["registration"] as? Bool,
            let speedUnit = json["speedUnit"] as? String,
            let twelveHourFormat = json["twelveHourFormat"] as? Bool,
            let version = json["version"] as? String,
            let zoom = json["zoom"] as? Int
            else {
                return nil
        }
        let coordinateFormat = json["coordinateFormat"] as? String

        self.attributes = attributes
        self.bingKey = bingKey
        self.coordinateFormat = coordinateFormat
        self.distanceUnit = distanceUnit
        self.forceSettings = forceSettings
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.map = map
        self.mapUrl = mapUrl
        self.readonly = readonly
        self.registration = registration
        self.speedUnit = speedUnit
        self.twelveHourFormat = twelveHourFormat
        self.version = version
        self.zoom = zoom
    }
}
