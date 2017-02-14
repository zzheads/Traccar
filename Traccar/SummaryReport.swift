//
//  ReportSummary.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation

//ReportSummary
//
//Property	Type	Description
//averageSpeed	number	in knots
//deviceId	integer
//deviceName	string
//distance	number	in meters
//engineHours	integer
//maxSpeed	number	in knots

class SummaryReport: BaseReport {
    let engineHours: Int
    
    required init?(with json: JSON) {
        guard
            let engineHours = json["engineHours"] as? Int
            else {
                return nil
        }
        self.engineHours = engineHours
        super.init(with: json)
    }
    
}
