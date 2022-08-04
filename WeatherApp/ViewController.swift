//
//  ViewController.swift
//  weatherApp
//
//  Created by Mike on 2.08.22.
//

import UIKit

class StartViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var currenweather: CurrentWeather?
    let networkService: NetworkService = NetworkService()
    
    @IBOutlet weak var cityTextField: UITextField!
    
    
    
    @IBAction func searchButton(_ sender: Any) {
        guard let textField = cityTextField.text else { return }
        fetchWeather(city: textField)
        
        // obrabotka vvoda; stroka ne pustaya ili cifr + mogno svoy proverky
    }
    
    // ubrat klaviaturu
    @IBAction func screenTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    
    func fetchWeather(city: String) {
        networkService.fetchWeather(city: city) { weather, error in
            if let weather = weather {
                self.currenweather = weather
                DispatchQueue.main.async {
                    self.showWeather()
                }
            } else {
                //show Allert
        }
    }
        
}
    
    func showWeather() {
        performSegue(withIdentifier: "showWeather", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "showWeather" {
            let dest = segue.destination as? WeatherViewController
            dest?.currentWeather = currenweather
        }
    }
    
}

