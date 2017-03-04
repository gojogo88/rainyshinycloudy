//
//  Service.swift
//  rainyshinycloudy
//
//  Created by Jonathan Go on 2017/03/02.
//  Copyright © 2017 Appdelight. All rights reserved.
//

import Alamofire


class Service {
    
   func downloadWeatherDetails(completed: @escaping (CurrentWeather) -> ()) {  //that weather inside parenthesis is the key to let ur WeatherVC knows the data
        
        //Alamofire download (parsing JSON data)
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
    
        Alamofire.request(currentWeatherURL).responseJSON { response in
            
            let result = response.result
            
            guard let dict = result.value as? Dictionary<String, AnyObject> else { return }    //u can only use that dict data inside {} if we use if let instead of guard let.  return means if the condition doesnt meet , get out. in this case it means if dict has no value( result.value is nil) then get out of this function
            
            let currentWeather = CurrentWeather(dict: dict)    //this line only means creating a variable to hold CurrentWeather(dict) data
            completed(currentWeather)
            
            // same as completed(CurrentWeather(dict: dict))
                
        }

    }
    
    func downloadForecastData(completed: @escaping ([Forecast]) -> ()) {  //that weather inside parenthesis is the key to let ur WeatherVC knows the data
        
        var forecastArr = [Forecast]()
        
        //Alamofire download (parsing JSON data)
        let forecastURL = URL(string: FORECAST_URL)!
        
        Alamofire.request(forecastURL).responseJSON { response in
            
            let result = response.result
            
            guard let dict = result.value as? Dictionary<String, AnyObject> else { return }    //u can only use that dict data inside { } if we use if let instead of guard let
            
            if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                
                for obj in list {
            
                    let objtogoinforecastArr = Forecast(weatherDict: obj)   //Forecast is the class in Forecast.swift
                    forecastArr.append(objtogoinforecastArr)

                
                }
                completed(forecastArr)
        }
        
    }
    
        
}


}


