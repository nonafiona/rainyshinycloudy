//
//  Constants.swift
//  rainyshinycloudy
//
//  Created by Fiona Carty on 1/1/17.
//  Copyright © 2017 Fiona Carty. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "2175963861a67d9dce42727bbc4cb849"

typealias DownloadComplete = () -> () 

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)-36\(LONGITUDE)123\(APP_ID)\(API_KEY)"

let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=-36&lon=123&cnt=10&mode=json&appid=2175963861a67d9dce42727bbc4cb849"
