//
//  GroupGeofence.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation

//GroupGeofence
//
//Property	Type
//geofenceId	integer
//groupId

class GroupGeofence: JSONDecodable {
    let geofenceId: Int
    let groupId: Int
    
    required init?(with json: JSON) {
        guard
            let geofenceId = json["geofenceId"] as? Int,
            let groupId = json["groupId"] as? Int
            else {
                return nil
        }
        self.geofenceId = geofenceId
        self.groupId = groupId
    }
}
