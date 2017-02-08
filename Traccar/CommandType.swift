//
//  CommandType.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation

//CommandType
//
//Property	Type
//type	string

class CommandType: JSONDecodable {
    let type: String
    
    required init?(with json: JSON) {
        guard
            let type = json["type"] as? String
            else {
                return nil
        }
        self.type = type
    }
}
