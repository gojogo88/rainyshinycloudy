//
//  CurrentWeather.swift
//  rainyshinycloudy
//
//  Created by Jonathan Go on 2017/03/01.
//  Copyright © 2017 Appdelight. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    // data encapsulation to make sure the code is safe.
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
    
    
    init(dict: Dictionary<String, AnyObject>) {
        
        if let name = dict["name"] as? String {
            
            self._cityName = name.capitalized
            print(self._cityName)
            
        }
        
        // check JSON result to figure out how to get the data
        if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
            
            if let main = weather[0]["main"] as? String {
                
                self._weatherType = main.capitalized
                print(self._weatherType)
                
            }
            
        }
        
        if let temp = dict["main"] as? Dictionary<String, AnyObject> {
            
            if let currentTemperature = temp["temp"] as? Double {
                
                let kelvinToCelcius = currentTemperature - 273.15
                
                self._currentTemp = Double(round(10 * kelvinToCelcius/10))
                print(self._currentTemp)
                
            }
            
        }
        
    
    
//    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
//        
//        //Alamofire download (parsing JSON data)
//        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
//        Alamofire.request(currentWeatherURL).responseJSON { response in
//            let result = response.result
//            //print(result)
//            if let dict = result.value as? Dictionary<String, AnyObject> {
//                
//                if let name = dict["name"] as? String {
//
//                    self._cityName = name.capitalized
//                    print(self._cityName)
//                    
//                }
//                
//                // check JSON result to figure out how to get the data
//                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
//                    
//                    if let main = weather[0]["main"] as? String {
//                        
//                        self._weatherType = main.capitalized
//                        print(self._weatherType)
//                        
//                    }
//                    
//                }
//                
//                if let temp = dict["main"] as? Dictionary<String, AnyObject> {
//                    
//                    if let currentTemperature = temp["temp"] as? Double {
//                        
//                        let kelvinToCelcius = currentTemperature - 273.15
//                        
//                        self._currentTemp = Double(round(10 * kelvinToCelcius/10))
//                        print(self._currentTemp)
//                        
//                    }
//                    
//                }
//                
//            }
//        completed()
//        }
//
//    }

}





        
}

