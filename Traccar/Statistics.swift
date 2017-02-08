//
//  Statistics.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation

//Statistics
//
//Property	Type
//activeDevices	integer
//activeUsers	integer
//captureTime	string (date-time)
//messagesReceived	integer
//messagesStored	integer
//requests	integer

class Statistics: JSONDecodable {
    let activeDevices: Int
    let activeUsers: Int
    let captureTime: String
    let messagesReceived: Int
    let messagesStored: Int
    let requests: Int
    
    required init?(with json: JSON) {
        guard
            let activeDevices = json["activeDevices"] as? Int,
            let activeUsers = json["activeUsers"] as? Int,
            let captureTime = json["captureTime"] as? String,
            let messagesReceived = json["messagesReceived"] as? Int,
            let messagesStored = json["messagesStored"] as? Int,
            let requests = json["requests"] as? Int
            else {
                return nil
        }
        self.activeDevices = activeDevices
        self.activeUsers = activeUsers
        self.captureTime = captureTime
        self.messagesReceived = messagesReceived
        self.messagesStored = messagesStored
        self.requests = requests
    }
}
