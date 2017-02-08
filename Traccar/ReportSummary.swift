//
//  ReportSummary.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation

//ReportSummary
//
//Property	Type	Description
//averageSpeed	number	in knots
//deviceId	integer
//deviceName	string
//distance	number	in meters
//engineHours	integer
//maxSpeed	number	in knots

class ReportSummary: JSONDecodable {
    let averageSpeed: Double
    let deviceId: Int
    let deviceName: String
    let distance: Double
    let engineHours: Int
    let maxSpeed: Double
    
    required init?(with json: JSON) {
        guard
            let averageSpeed = json["averageSpeed"] as? Double,
            let deviceId = json["deviceId"] as? Int,
            let deviceName = json["deviceName"] as? String,
            let distance = json["distance"] as? Double,
            let engineHours = json["engineHours"] as? Int,
            let maxSpeed = json["maxSpeed"] as? Double
            else {
                return nil
        }
        self.averageSpeed = averageSpeed
        self.deviceId = deviceId
        self.deviceName = deviceName
        self.distance = distance
        self.engineHours = engineHours
        self.maxSpeed = maxSpeed
    }
    
}
