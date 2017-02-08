//
//  DeviceTotalDistance.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation

//DeviceTotalDistance
//
//Property	Type	Description
//deviceId	integer
//totalDistance	number	in meters

class DeviceTotalDistance: JSONDecodable {
    let deviceId: Int
    let totalDistance: Int
    
    required init?(with json: JSON) {
        guard
            let deviceId = json["deviceId"] as? Int,
            let totalDistance = json["totalDistance"] as? Int
            else {
                return nil
        }
        self.deviceId = deviceId
        self.totalDistance = totalDistance
    }
}
