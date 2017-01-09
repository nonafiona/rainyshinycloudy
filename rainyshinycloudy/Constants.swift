//
//  Constants.swift
//  rainyshinycloudy
//
//  Created by Fiona Carty on 1/1/17.
//  Copyright © 2017 Fiona Carty. All rights reserved.
//

import Foundation

typealias DownloadComplete = () -> ()

// MARK: Current Weather URL

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=2175963861a67d9dce42727bbc4cb849"

// MARK: 10 day Forecast URL

let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&mode=json&appid=2175963861a67d9dce42727bbc4cb849"
