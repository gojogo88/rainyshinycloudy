//
//  AlamoDownload.swift
//  rainyshinycloudy
//
//  Created by Jonathan Go on 2017/03/02.
//  Copyright © 2017 Appdelight. All rights reserved.
//

import Alamofire

var currentWeather = CurrentWeather()
var forecasts = [Forecast]()

class AlamoDownload {
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        
        //Alamofire download (parsing JSON data)
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON { response in
            let result = response.result
            //print(result)
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                currentWeather.parseDataFrom(dict: dict)
                
            }
            
            completed()
        }
        
    }

    func downloadForecastData(completed: @escaping DownloadComplete) {
        //Downloading forecast data for tableView
        let forecastURL = URL(string: FORECAST_URL)!
        Alamofire.request(forecastURL).responseJSON { response in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in list {
                        
                        let forecast = Forecast()
                        forecast.parseDataFrom(weatherDict: obj)
                        forecasts.append(forecast)
                        //print(obj)
                    }
                    
                }
                
            }
            
            completed()
        }
        
    }
    
}
