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
        print("Trying to fetch: \(TraccarEndpoint.server.url)")
        apiClient.fetch(endpoint: TraccarEndpoint.server) {(info: [Server]?) in
            guard
                let info = info,
                let server = info.first
                else {
                    print("Error")
                    return
            }
            print(server.prettyPrint(with: 0))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

