//
//  WeatherCell.swift
//  rainyshinycloudy
//
//  Created by Fiona Carty on 1/3/17.
//  Copyright © 2017 Fiona Carty. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
    func configureCell(forecast: Forecast) {
        lowTemp.text = "\(forecast.lowTemp)"
        highTemp.text = "\(forecast.highTemp)"
        weatherType.text = forecast.weatherType
        weatherIcon.image = UIImage(named: forecast.weatherType)
        dayLabel.text = forecast.date
    }

}
