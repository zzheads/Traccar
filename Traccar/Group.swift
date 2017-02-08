//
//  Group.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation

//Group
//
//Property	Type
//attributes
//groupId	integer
//id	integer
//name	string

class Group: JSONDecodable {
    let attributes: [AttributeAlias]
    let groupId: Int
    let id: Int
    let name: String
    
    required init?(with json: JSON) {
        guard
            let attributesJson = json["attributes"] as? [JSON],
            let attributes = [AttributeAlias](with: attributesJson),
            let groupId = json["groupId"] as? Int,
            let id = json["id"] as? Int,
            let name = json["name"] as? String
            else {
                return nil
        }
        self.attributes = attributes
        self.groupId = groupId
        self.id = id
        self.name = name
    }
}
