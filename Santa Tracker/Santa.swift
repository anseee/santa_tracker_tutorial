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
    
    //  또한, Realm 이 currentLocation 속성을 저장하지 않도록 하기 위해 ignoredProperties 를 사용했습니다.
    override static func ignoredProperties() -> [String] {
        return ["currentLocation"]
    }
}
