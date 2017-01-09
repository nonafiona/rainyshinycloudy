//
//  CurrentWeather.swift
//  rainyshinycloudy
//
//  Created by Fiona Carty on 1/1/17.
//  Copyright © 2017 Fiona Carty. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    
    // MARK: Properties
    
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    // MARK: Data Encapsulation
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    // MARK: Downloading Current Weather 
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        //Alamofire download
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            
            let result = response.result
            
            // MARK: Result Dictionary
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                // MARK: City Name
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                }
                
                // MARK: Weather Dictionary
                
                if let weather = dict["weather"] as? [Dictionary<String,AnyObject>] {
                    
                    // MARK: Main Weather Condition
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                    }
                }
                
                // MARK: Main Dictionary
                
                if let main = dict["main"] as? Dictionary<String,AnyObject> {
                    
                    // MARK: Current Temperature
                    if let currentTemperature = main["temp"] as? Double {
                        
                        let kelvinToFarenheitPreDivision = (currentTemperature * (9/5)-459.67)
                        let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                        
                        self._currentTemp = kelvinToFarenheit
                        
                    }
                }
               completed() 
            }
            
        }
        
    }
}
