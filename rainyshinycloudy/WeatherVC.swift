//
//  WeatherVC.swift
//  rainyshinycloudy
//
//  Created by Jonathan Go on 2017/02/28.
//  Copyright © 2017 Appdelight. All rights reserved.
//

import UIKit
//import Alamofire

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dayweatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    

    
    @IBOutlet weak var tableView: UITableView!
    
//    var currentWeather = CurrentWeather()
//    var forecast: Forecast!
//    var forecasts = [Forecast]()
    
    let service = Service()
    var currentWeather = CurrentWeather()
    var forecastArr = [Forecast]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.delegate = self
//        tableView.dataSource = self
//        
//        currentWeather = CurrentWeather()  //instantiated as an empty CurrentWeather class
//
//        currentWeather.downloadWeatherDetails {
//            self.downloadForecastData {
//                self.updateMainUI()
//            }
//        }
        
        service.downloadWeatherDetails { (weather) in
            
            self.currentWeather = weather
            self.updateMainUI()
            
            print(weather)      //weather is the data object
        
        }

        service.downloadForecastData { (dayforecast) in
            self.forecastArr = dayforecast  //daytoforcast is already a completed passed array from service.swift
            
            for obj in self.forecastArr {
           
            print(obj.lowTemp)
            }
            self.tableView.reloadData()
        }

    }
    
//    func downloadForecastData(completed: @escaping DownloadComplete) {
//        //Downloading forecast data for tableView
//        let forecastURL = URL(string: FORECAST_URL)!
//        Alamofire.request(forecastURL).responseJSON { response in
//         
//            let result = response.result
//            
//            if let dict = result.value as? Dictionary<String, AnyObject> {
//                
//                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
//                    
//                    for obj in list {
//                        
//                        let forecast = Forecast(weatherDict: obj)
//                        self.forecasts.append(forecast)
//                        print(obj)
//                    }
//                    
//                }
//                
//            }
//            
//            completed()
//        }
//        
//    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? updateTableCell {
            
            let forecast = forecastArr[indexPath.row]
            cell.updateTableCell(forecast: forecast)
            return cell
        } else {
            
            return WeatherCell()
            
        }
    }
    
    func updateMainUI() {
        
        dateLabel.text = currentWeather.date
        currentTempLabel.text = "\(currentWeather.currentTemp)°"
        currentWeatherLabel.text = currentWeather.weatherType
        locationLabel.text = currentWeather.cityName
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
        
    }
    
    func updateTableCell(forecast: Forecast) {
        
        lowTemp.text = forecast.lowTemp
        highTemp.text = forecast.highTemp
        dayweatherType.text = forecast.weatherType
        dayLabel.text = forecast.date
        weatherIcon.image = UIImage(named: "\(forecast.weatherType) Mini")
        
    }
    

}

