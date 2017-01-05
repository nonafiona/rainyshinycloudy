//
//  Location.swift
//  rainyshinycloudy
//
//  Created by Fiona Carty on 1/4/17.
//  Copyright © 2017 Fiona Carty. All rights reserved.
//

import Foundation
import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
    
}
