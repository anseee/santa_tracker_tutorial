//
//  Stop.swift
//  Santa Tracker
//
//  Created by 박성원 on 2017. 2. 5..
//  Copyright © 2017년 sungwon. All rights reserved.
//

import UIKit
import RealmSwift

class Stop: Object {
    dynamic var location: Location?
    dynamic var time: NSDate = NSDate(timeIntervalSinceReferenceDate: 0)
    
    convenience init(location: Location, time: NSDate) {
        self.init()
        self.location = location
        self.time = time
    }
}
