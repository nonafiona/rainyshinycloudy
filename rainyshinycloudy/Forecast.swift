//
//  Forecast.swift
//  rainyshinycloudy
//
//  Created by Fiona Carty on 1/3/17.
//  Copyright © 2017 Fiona Carty. All rights reserved.
//

import UIKit
import Alamofire

class Forecast{
    
    // MARK: Properties
    
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    // MARK: Data Encapsulation
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    // MARK: List Dictionary
    
    init(weatherDict: Dictionary<String,AnyObject>) {
        
        // MARK: Temperature Dictionary
        
        if let temp = weatherDict["temp"] as? Dictionary<String,AnyObject> {
            
            if let min = temp["min"] as? Double {
                let kelvinToFarenheitPreDivision = (min * (9/5)-459.67)
                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                
                self._lowTemp = "\(kelvinToFarenheit)"
            }
            
            if let max = temp["max"] as? Double {
                let kelvinToFarenheitPreDivision = (max * (9/5)-459.67)
                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                
                self._highTemp = "\(kelvinToFarenheit)"
            }
        }
    
        // MARK: Weather Dictionary
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        // MARK: Date 
        if let date = weatherDict["dt"] as? Double {
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
        }
        
    }
    
}

// MARK: Extensions

extension Date {
    func dayOfTheWeek() -> String {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
