//
//  WeatherViewController.swift
//  weatherApp
//
//  Created by Mike on 2.08.22.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var currentWeather: CurrentWeather?
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperaturaLabel: UILabel!
    @IBOutlet weak var weatherDiscription: UILabel!
    @IBOutlet weak var minMaxTemperaturaLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var visabilityLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(currentWeather?.name)
        setupLabels()
    }
    
    func setupLabels() {
        guard let currentWeather = currentWeather else { return }
    
        cityNameLabel.text = currentWeather.name
        temperaturaLabel.text = "\(round(currentWeather.main.temp))°"
        weatherDiscription.text = currentWeather.weather[0].description
        minMaxTemperaturaLabel.text = "min   \(round(currentWeather.main.temp_min))° max   \(round(currentWeather.main.temp_max))°"
        
        humidityLabel.text = "\(currentWeather.main.humidity)%"
        pressureLabel.text = "\(currentWeather.main.pressure)mPa"
        visabilityLabel.text = "\(currentWeather.visibility)m"
        feelsLikeLabel.text = "\(currentWeather.main.feels_like)"
    }
    

}
