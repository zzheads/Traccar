//
//  Device.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation
import Alamofire

//Device
//
//Property	Type
//attributes
//category	string
//contact	string
//geofenceIds	array
//groupId	integer
//id	integer
//lastUpdate	string (date-time)
//model	string
//name	string
//phone	string
//positionId	integer
//status	string
//uniqueId	string

class Device: JSONDecodable, PrettyPrintable {
    let attributes: JSON
    let category: String
    let contact: String
    let geofenceIds: [Int]
    let groupId: Int
    let id: Int
    let lastUpdate: String
    let model: String
    let name: String
    let phone: String
    let positionId: Int
    let status: String
    let uniqueId: String
    
    init(attributes: JSON, category: String, contact: String, geofenceIds: [Int], groupId: Int, id: Int, lastUpdate: String, model: String, name: String, phone: String, positionId: Int, status: String, uniqueId: String) {
        self.attributes = attributes
        self.category = category
        self.contact = contact
        self.geofenceIds = geofenceIds
        self.groupId = groupId
        self.id = id
        self.lastUpdate = lastUpdate
        self.model = model
        self.name = name
        self.phone = phone
        self.positionId = positionId
        self.status = status
        self.uniqueId = uniqueId
    }
    
    required convenience init?(with json: JSON) {
        guard
            let attributes = json["attributes"] as? JSON,
            let category = json["category"] as? String,
            let contact = json["contact"] as? String,
            let geofenceIds = json["geofenceIds"] as? [Int],
            let groupId = json["groupId"] as? Int,
            let id = json["id"] as? Int,
            let lastUpdate = json["lastUpdate"] as? String,
            let model = json["model"] as? String,
            let name = json["name"] as? String,
            let phone = json["phone"] as? String,
            let positionId = json["positionId"] as? Int,
            let status = json["status"] as? String,
            let uniqueId = json["uniqueId"] as? String
            else {
                return nil
        }
        self.init(attributes: attributes, category: category, contact: contact, geofenceIds: geofenceIds, groupId: groupId, id: id, lastUpdate: lastUpdate, model: model, name: name, phone: phone, positionId: positionId, status: status, uniqueId: uniqueId)
    }
    
    var parameters: Parameters {
        return ["attributes": attributes, "category": category, "contact": contact, "geofenceIds": geofenceIds, "groupId": groupId, "id": id, "lastUpdate": lastUpdate, "model": model, "name": name, "phone": phone, "positionId": positionId, "status": status, "uniqueId": uniqueId]
    }
}

//extension Device {
//    func prettyPrint(with level: Int) -> String {
//        var tab = ""
//        for _ in 0..<level {
//            tab += "\t"
//        }
//        return "\(tab)\(type(of: self))<\(CFHash(self))>: {\n\t\(tab)\"attributes\" : \(attributes),\n\t\(tab)\"category\": \(category),\n\t\(tab)\"contact\": \(contact),\n\t\(tab)\"geofenceIds\": \(geofenceIds),\n\t\(tab)\"groupId\": \(groupId),\n\t\(tab)\"id\": \(id),\n\t\(tab)\"lastUpdate\": \(lastUpdate),\n\t\(tab)\"model\": \(model),\n\t\(tab)\"name\": \(name),\n\t\(tab)\"phone\": \(phone),\n\t\(tab)\"positionId\": \(positionId),\n\t\(tab)\"status\": \(status),\n\t\(tab)\"uniqueId\": \(uniqueId)\n\(tab)}"
//    }
//}

