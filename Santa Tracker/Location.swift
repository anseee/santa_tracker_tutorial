//
//  Location.swift
//  Santa Tracker
//
//  Created by 박성원 on 2017. 1. 17..
//  Copyright © 2017년 sungwon. All rights reserved.
//

import UIKit
import RealmSwift
import CoreLocation

class Location: Object {
    dynamic var latitude: Double = 0.0
    dynamic var longitude: Double = 0.0
    
    convenience init(latitude: Double, longitude: Double) {
        self.init()
        self.latitude = latitude
        self.longitude = longitude
    }
}

extension Location {
    var clLocationCoordinate2D: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
