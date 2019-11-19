//
//  ViewController.swift
//  FSQ-iOS
//
//  Created by Kyle Wiltshire on 11/14/19.
//  Copyright © 2019 Kyle Wiltshire. All rights reserved.
//

import UIKit
import CoreLocation
import Pilgrim

class ViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    
    var locationManager = CLLocationManager()
    var foursquareManager = FoursquareManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        PilgrimManager.shared().start()
        PilgrimManager.shared().getCurrentLocation { (currentLocation, error) in
            if let e = error {
                print("error: \(e)")
            } else {
                if let location = currentLocation {
                    if let venue = location.currentPlace.venue {
                        print(venue.name)
                    }
                }
            }
        }
        
    }

    @IBAction func clickMeButtonPressed(_ sender: UIButton) {
    PilgrimManager.shared().visitTester?.fireTestVisit(confidence: .medium, type: .venue, departure: false)
    }
    
    @IBAction func findVenuesButtonPressed(_ sender: UIButton) {
        foursquareManager.getVenues()
    }
}

