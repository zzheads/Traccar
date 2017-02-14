//
//  BaseReport.swift
//  Traccar
//
//  Created by Alexey Papin on 14.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation

//private long deviceId;
//private String deviceName;
//private double distance; // meters
//private double averageSpeed; // knots
//private double maxSpeed; // knots

class BaseReport: JSONDecodable, PrettyPrintable {
    let deviceId: Int
    let deviceName: String
    let distance: Double
    let averageSpeed: Double
    let maxSpeed: Double
    
    required init?(with json: JSON) {
        guard
            let deviceId = json["deviceId"] as? Int,
            let deviceName = json["deviceName"] as? String,
            let distance = json["distance"] as? Double,
            let averageSpeed = json["averageSpeed"] as? Double,
            let maxSpeed = json["maxSpeed"] as? Double
            else {
                return nil
        }
        self.deviceId = deviceId
        self.deviceName = deviceName
        self.averageSpeed = averageSpeed
        self.distance = distance
        self.maxSpeed = maxSpeed
    }
}
