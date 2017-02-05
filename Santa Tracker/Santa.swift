//
//  Santa.swift
//  Santa Tracker
//
//  Created by 박성원 on 2017. 1. 17..
//  Copyright © 2017년 sungwon. All rights reserved.
//

import UIKit
import RealmSwift

class Santa: Object {
    dynamic var _currentLocation: Location?
    
    var currentLocation: Location {
        get {
            // 산타가 어디있는지 알지 못한다면, 산타는 여전히 그의 집에 있을 것으로 추정됩니다.
            return _currentLocation ?? Location(latitude: 90, longitude: 180)
        }
        set {
            _currentLocation = newValue
        }
    }

    let route = List<Stop>()
    private dynamic var _activity: Int = 0
    var activity: Activity {
        get {
            return Activity(rawValue: _activity)!
        }
        set {
            _activity = newValue.rawValue
        }
    }
    
    // 산타가 배달해야할 선물 갯수
    dynamic var presentsRemaining: Int = 0
    
    //  또한, Realm 이 currentLocation 속성을 저장하지 않도록 하기 위해 ignoredProperties 를 사용했습니다.
    override static func ignoredProperties() -> [String] {
        return ["currentLocation", "activity"]
    }
}

extension Santa {
    static func test() -> Santa {
        let santa = Santa()
        // 지도상에서 빠른 확인을 위해 서울 좌표로 설정했습니다.
        santa.currentLocation = Location(latitude: 37.566535, longitude: 126.977969)
        santa.activity = .deliveringPresents
        santa.presentsRemaining = 42
        return santa
    }
}
