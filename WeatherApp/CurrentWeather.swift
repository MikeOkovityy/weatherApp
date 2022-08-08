//
//  CurrentWeather.swift
//  weatherApp
//
//  Created by Mike on 2.08.22.
//

import Foundation

struct CurrentWeather: Codable {
    let coord: Coordinates
    let weather: [WeatherDicrription]
    let main: TempInfo
    let visibility: Int
    let wind: WindParameters
    let dt: Int
    let timezone: Int
    let name: String
    let cod: Int
}

struct Coordinates: Codable {
    let lon: Double
    let lat: Double
}

struct WeatherDicrription: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct TempInfo: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}

struct WindParameters: Codable {
    let speed: Double
    let deg: Int
}
