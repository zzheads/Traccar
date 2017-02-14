//
//  User.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation

//User
//
//Property	Type
//admin	boolean
//attributes
//coordinateFormat	string
//deviceLimit	integer
//disabled	boolean
//distanceUnit	string
//email	string
//expirationTime	string (date-time)
//id	integer
//latitude	number
//longitude	number
//map	string
//name	string
//password	string
//readonly	boolean
//speedUnit	string
//token	string
//twelveHourFormat	boolean
//zoom	integer

class User: JSONDecodable, PrettyPrintable {
    let admin: Bool
    let attributes: JSON
    let coordinateFormat: String
    let deviceLimit: Int
    let disabled: Bool
    let distanceUnit: String
    let email: String
    let expirationTime: String?
    let id: Int
    let latitude: Double
    let longitude: Double
    let map: String
    let name: String
    let password: String?
    let readonly: Bool
    let speedUnit: String
    let token: String?
    let twelveHourFormat: Bool
    let zoom: Int
    
    required init?(with json: JSON) {
        guard
            let admin = json["admin"] as? Bool,
            let attributes = json["attributes"] as? JSON,
            let coordinateFormat = json["coordinateFormat"] as? String,
            let deviceLimit = json["deviceLimit"] as? Int,
            let disabled = json["disabled"] as? Bool,
            let distanceUnit = json["distanceUnit"] as? String,
            let email = json["email"] as? String,
            let id = json["id"] as? Int,
            let latitude = json["latitude"] as? Double,
            let longitude = json["longitude"] as? Double,
            let map = json["map"] as? String,
            let name = json["name"] as? String,
            let readonly = json["readonly"] as? Bool,
            let speedUnit = json["speedUnit"] as? String,
            let twelveHourFormat = json["twelveHourFormat"] as? Bool,
            let zoom = json["zoom"] as? Int
            else {
                return nil
        }
        let expirationTime = json["expirationTime"] as? String
        let password = json["password"] as? String
        let token = json["token"] as? String
        
        self.admin = admin
        self.attributes = attributes
        self.coordinateFormat = coordinateFormat
        self.deviceLimit = deviceLimit
        self.disabled = disabled
        self.distanceUnit = distanceUnit
        self.email = email
        self.expirationTime = expirationTime
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.map = map        
        self.name = name
        self.password = password
        self.readonly = readonly
        self.speedUnit = speedUnit
        self.token = token
        self.twelveHourFormat = twelveHourFormat
        self.zoom = zoom
    }
    
}
