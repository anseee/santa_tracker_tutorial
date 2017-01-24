//
//  MapManager.swift
//  Santa Tracker
//
//  Created by 박성원 on 2017. 1. 24..
//  Copyright © 2017년 sungwon. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapManager: NSObject {
    private let santaAnnotation = MKPointAnnotation()
    
    init(mapView: MKMapView) {
        santaAnnotation.title = "🎅"
        super.init()
        mapView.addAnnotation(self.santaAnnotation)
    }
    
    func update(with santa: Santa) {
        
        let santaLocation = santa.currentLocation.clLocationCoordinate2D

        // Santa 를 생성한 쓰레드 외의 쓰레드에서는 Santa 에 접근할 수 없기 때문에 
        // Santa 를 직접 메인 쓰레드로 넘겨줄 수는 없습니다.
        dispatch_async(dispatch_get_main_queue(),{
            self.santaAnnotation.coordinate = santaLocation
        })

    }
}
