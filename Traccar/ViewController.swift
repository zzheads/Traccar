//
//  ViewController.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let apiClient = AlamoAPIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let device = Device(attributes: [:], category: "Test", contact: "", geofenceIds: [], groupId: 1, id: 2, lastUpdate: "2016-01-01", model: "Super", name: "Mario", phone: "223322", positionId: 0, status: "active", uniqueId: "SuperMario")
        apiClient.send(endpoint: TraccarEndpoint.devices(device: device)) { (string: String?) in
            print("\(string)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

