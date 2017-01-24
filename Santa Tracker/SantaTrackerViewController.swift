//
//  ViewController.swift
//  Santa Tracker
//
//  Created by 박성원 on 2017. 1. 17..
//  Copyright © 2017년 sungwon. All rights reserved.
//

import UIKit
import MapKit
import RealmSwift

class SantaTrackerViewController: UIViewController {

    @IBOutlet private weak var timeRemainingLabel: UILabel!
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var activityLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var presentsRemainingLabel: UILabel!
    
    // Has to be implicitly unwrapped
    // Needs the reference to the map view
    private var mapManager: MapManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the map manager
        mapManager = MapManager(mapView: mapView)
        
        // Find the Santa data in Realm
        let realm = try! Realm()
        let santas = realm.objects(Santa.self)
        
        // Set up the test Santa if he's not already there
        if santas.isEmpty {
            try? realm.write {
                realm.add(Santa.test())
            }
        }
        
        // Be responsible in unwrapping!
        if let santa = santas.first {
            // Update the map
            mapManager.update(with: santa)
        }
    }

}

