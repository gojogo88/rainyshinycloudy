//
//  WeatherCell.swift
//  rainyshinycloudy
//
//  Created by Jonathan Go on 2017/03/04.
//  Copyright © 2017 Appdelight. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dayWeatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
    
    func configureCell(forecast: Forecast)  {
        
        dayLabel.text = forecast.date
        dayWeatherType.text = forecast.weatherType
        highTemp.text = forecast.highTemp
        lowTemp.text = forecast.lowTemp
        weatherIcon.image = UIImage(named: "\(forecast.weatherType) Mini")
        
    }
    
    

}
