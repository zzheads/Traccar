//
//  ReportTrips.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation

//ReportTrips
//
//Property	Type	Description
//averageSpeed	number	in knots
//deviceId	integer
//deviceName	string
//distance	number	in meters
//duration	integer
//endAddress	string
//endLat	number
//endLon	number
//endTime	string (date-time)
//maxSpeed	number	in knots
//startAddress	string
//startLat	number
//startLon	number
//startTime	string (date-time)

class ReportTrips: JSONDecodable {
    let averageSpeed: Double
    let deviceId: Int
    let deviceName: String
    let distance: Double
    let duration: Int
    let endAddress: String
    let endLat: Double
    let endLon: Double
    let endTime: String
    let maxSpeed: Double
    let startAddress: String
    let startLat: Double
    let startLon: Double
    let startTime: String
    
    required init?(with json: JSON) {
        guard
            let averageSpeed = json["averageSpeed"] as? Double,
            let deviceId = json["deviceId"] as? Int,
            let deviceName = json["deviceName"] as? String,
            let distance = json["distance"] as? Double,
            let duration = json["duration"] as? Int,
            let endAddress = json["endAddress"] as? String,
            let endLat = json["endLat"] as? Double,
            let endLon = json["endLon"] as? Double,
            let endTime = json["endTime"] as? String,
            let maxSpeed = json["maxSpeed"] as? Double,
            let startAddress = json["startAddress"] as? String,
            let startLat = json["startLat"] as? Double,
            let startLon = json["startLon"] as? Double,
            let startTime = json["startTime"] as? String
            else {
                return nil
        }
        self.averageSpeed = averageSpeed
        self.deviceId = deviceId
        self.deviceName = deviceName
        self.distance = distance
        self.duration = duration
        self.endAddress = endAddress
        self.endLat = endLat
        self.endLon = endLon
        self.endTime = endTime
        self.maxSpeed = maxSpeed
        self.startAddress = startAddress
        self.startLat = startLat
        self.startLon = startLon
        self.startTime = startTime
    }
}
