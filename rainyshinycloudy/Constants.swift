//
//  Constants.swift
//  rainyshinycloudy
//
//  Created by Jonathan Go on 2017/03/01.
//  Copyright © 2017 Appdelight. All rights reserved.
//

import Foundation

let BASE_URL = "http://samples.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "e6844efc155783ea6a99960a72a7dcd6"

typealias  DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)-36\(LONGITUDE)123\(APP_ID)\(API_KEY)"

let FORECAST_URL = "http://samples.openweathermap.org/data/2.5/forecast/daily?lat=-36&lon=123&cnt=10&appid=b1b15e88fa797225412429c1c50c122a1"
