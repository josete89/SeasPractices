//
//  WeatherViewController.swift
//  TenUnit_SecondPractice
//
//  Created by Jose Luis Alcala Ramos on 11/07/14.
//  Copyright (c) 2014 Seas. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var city:String = "";
    var codeCountryCity = "";
    var weather:Weather?;
    
    @IBOutlet var weatherImage: UIImageView
    @IBOutlet var cityLabel: UILabel
    @IBOutlet var tempLabel: UILabel
    @IBOutlet var activity: UIActivityIndicatorView
    
    
    
    @IBAction func tocuhFOreacst(sender: AnyObject) {
        let url:NSURL = NSURL(string: self.weather?.forecastUrl);
        UIApplication.sharedApplication().openURL(url);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Tiempo de \(self.city)";
        let country = self.codeCountryCity.componentsSeparatedByString(",")[0];
        let city = self.codeCountryCity.componentsSeparatedByString(",")[1];
        self.activity.startAnimating();
        
        WeatherCore().getWeatherFrom(country, city: city,completionClosure:{
            weather,error in
            if(!error && weather){
                let imageData:NSData = NSData(contentsOfURL: NSURL(string:weather?.urlImage));
                 dispatch_async(dispatch_get_main_queue(), {
                    self.cityLabel.text = self.city;
                    self.tempLabel.text = "\(weather?.tempCelsius)º";
                    self.weatherImage.image = UIImage(data:imageData);
                    self.activity.stopAnimating();
                    self.weather = weather;
                });
            }else{
                var alert:UIAlertView = UIAlertView(title: "Error", message: "Algo ha ido mal,salga y entre", delegate: nil, cancelButtonTitle:"Ok");
                alert.show();
            }
            
        });
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
}
