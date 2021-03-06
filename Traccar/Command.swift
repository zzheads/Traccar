//
//  Command.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation

//Command
//
//Property	Type
//attributes
//deviceId	integer
//type	string

class Command: JSONDecodable {
    let attributes: JSON
    let deviceId: Int
    let type: String
    
    required init?(with json: JSON) {
        guard
            let attributes = json["attributes"] as? JSON,
            let deviceId = json["deviceId"] as? Int,
            let type = json["type"] as? String
            else {
                return nil
        }
        self.attributes = attributes
        self.deviceId = deviceId
        self.type = type
    }
}
