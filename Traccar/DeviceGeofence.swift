//
//  DeviceGeofence.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation

//DeviceGeofence
//
//Property	Type
//deviceId	integer
//geofenceId	integer

class DeviceGeofence: JSONDecodable {
    let deviceId: Int
    let geofenceId: Int
    
    required init?(with json: JSON) {
        guard
            let deviceId = json["deviceId"] as? Int,
            let geofenceId = json["geofenceId"] as? Int
            else {
                return nil
        }
        self.deviceId = deviceId
        self.geofenceId = geofenceId
    }
}
