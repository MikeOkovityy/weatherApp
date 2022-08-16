//
//  dailyWeather.swift
//  WeatherApp
//
//  Created by Mike on 4.08.22.
//

import Foundation

struct DailyWeather: Codable {
    let timezoneOffset: Int
    let hourly: [Hourly]
    let daily: [Daily]
}
struct Hourly: Codable {
    let dt: Double
    let temp: Double
    let weather: [WeatherDicrription]
}
struct Daily: Codable {
    let dt: Double
    let temp: DailyTemp
    let weather: [WeatherDicrription]
}
struct DailyTemp: Codable {
    let min: Double
    let max: Double
}
