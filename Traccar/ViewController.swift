//
//  ViewController.swift
//  Traccar
//
//  Created by Alexey Papin on 08.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let apiClient = APIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiClient.getArray(endpoint: TraccarEndpoint.devices(id: nil, nil)) { (devices: [Device]?) in
            guard let devices = devices else {
                print("Something wrong!")
                return
            }
            print(devices.prettyPrint(with: 0))
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

