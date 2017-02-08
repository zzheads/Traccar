//
//  GroupPermission.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation

//GroupPermission
//
//Property	Type
//groupId	integer
//userId	integer

class GroupPermission: JSONDecodable {
    let groupId: Int
    let userId: Int
    
    required init?(with json: JSON) {
        guard
            let groupId = json["groupId"] as? Int,
            let userId = json["userId"] as? Int
            else {
                return nil
        }
        self.groupId = groupId
        self.userId = userId
    }
}
