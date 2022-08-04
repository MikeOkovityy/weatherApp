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
        let apiKey = "4f594b6caca6beb3a15d373071f8751a"
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric") else { return }
        var reguest = URLRequest(url: url)
        reguest.httpMethod = "GET"
        
        
        let session = URLSession.shared
        let task = session.dataTask(with: reguest) { data, responce, error in
            if let error = error {
                print(error)
                // make allert: oshibka zaprosa, "error" - chtoto poshlo ne tak
            } else if let data = data, let responce = responce  as? HTTPURLResponse{
                
                if responce.statusCode == 200 {
                    let weatherDate: CurrentWeather
                    do {
                        
                        weatherDate = try JSONDecoder().decode(CurrentWeather.self, from: data)
                        self.currenweather = weatherDate
                        DispatchQueue.main.async {
                            self.showWeather()
                        }
                        print(weatherDate.name)
                    } catch let errorDecode {
                        print(errorDecode)
                    }
                } else {
                    // make Allert: necorrectno vveden gorod
                }
                
            }
        }
        
        task.resume()
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

