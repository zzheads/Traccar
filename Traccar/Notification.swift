//
//  Notification.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation

//Notification
//
//Property	Type
//attributes
//id	integer
//type	string
//userId	integer

class Notification: JSONDecodable, PrettyPrintable {
    let attributes: JSON
    let id: Int
    let userId: Int
    
    required init?(with json: JSON) {
        guard
            let attributes = json["attributes"] as? JSON,
            let id = json["id"] as? Int,
            let userId = json["userId"] as? Int
            else {
                return nil
        }
        self.attributes = attributes
        self.id = id
        self.userId = userId
    }
}
