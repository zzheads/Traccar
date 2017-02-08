//
//  DevicePermission.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation

//DevicePermission
//
//Property	Type
//deviceId	integer
//userId	integer

class DevicePermission: JSONDecodable {
    let deviceId: Int
    let userId: Int
    
    required init?(with json: JSON) {
        guard
            let deviceId = json["deviceId"] as? Int,
            let userId = json["userId"] as? Int
            else {
                return nil
        }
        self.deviceId = deviceId
        self.userId = userId
    }
}
