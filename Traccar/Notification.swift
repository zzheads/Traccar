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

class Notification: JSONDecodable {
    let attributes: [AttributeAlias]
    let id: Int
    let userId: Int
    
    required init?(with json: JSON) {
        guard
            let attributesJson = json["attributes"] as? [JSON],
            let attributes = [AttributeAlias](with: attributesJson),
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
