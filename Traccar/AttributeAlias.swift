//
//  AttributeAlias.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation

//AttributeAlias
//
//Property	Type
//alias	string
//attribute	string
//deviceId	integer
//id	integer

class AttributeAlias: JSONDecodable {
    let alias: String
    let attribute: String
    let deviceId: Int
    let id: Int
    
    required init?(with json: JSON) {
        guard
            let alias = json["alias"] as? String,
            let attribute = json["attribute"] as? String,
            let deviceId = json["deviceId"] as? Int,
            let id = json["id"] as? Int
            else {
                return nil
        }
        self.alias = alias
        self.attribute = attribute
        self.deviceId = deviceId
        self.id = id
    }
}
