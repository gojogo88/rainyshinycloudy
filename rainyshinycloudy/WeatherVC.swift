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
    
    @IBOutlet weak var tableView: UITableView!
    
    let service = Service()
    var currentWeather = CurrentWeather()
    var forecastArr = [Forecast]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
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

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            
            let forecast = forecastArr[indexPath.row]
            cell.configureCell(forecast: forecast)
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

    

}

