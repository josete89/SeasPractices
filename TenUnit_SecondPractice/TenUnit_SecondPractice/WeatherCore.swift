//
//  WeatherCore.swift
//  TenUnit_SecondPractice
//
//  Created by Jose Luis Alcala Ramos on 11/07/14.
//  Copyright (c) 2014 Seas. All rights reserved.
//

import Foundation


class Weather{
    
    var urlImage:String;
    var tempCelsius:Double;
    var forecastUrl:String;
    
    init(urlImage:String,tempCelsius:Double,forecastUrl:String){
        self.urlImage = urlImage;
        self.tempCelsius = tempCelsius;
        self.forecastUrl = forecastUrl;
    }
    
}

class WeatherCore{
    
    let apiKey = "4065b22063267529";
    
    let urlWeather = "http://api.wunderground.com/api/";
    
    
    
    func getWeatherFrom(country:String,city:String,completionClosure: (weather:Weather?,error:NSError?) -> ()){
        let url:String = self.urlWeather+self.apiKey+"/conditions/q/\(country)/\(city).json";
        
        NSURLConnection.sendAsynchronousRequest(NSURLRequest(URL: NSURL(string: url)), queue: NSOperationQueue(), completionHandler:{ response,data,error in
            var error: NSError?
            let jsonData: NSData = data;
            
            let jsonDict:NSDictionary = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: &error) as NSDictionary
            
            println("JSON recived "+jsonDict.debugDescription)
            
            if (error)
            {
                completionClosure(weather: nil, error: error);
            }
            else if(!jsonDict.valueForKey("current_observation") ){
                
                let userInfo:[NSObject:String] = [NSLocalizedDescriptionKey:"JSON not correct",NSLocalizedFailureReasonErrorKey:"JSON not correct",NSLocalizedRecoverySuggestionErrorKey:"JSON not correct"];
                
                error = NSError(domain: "WheatherApp", code: 500, userInfo: userInfo);
                
                completionClosure(weather: nil, error: error);
                
            }else if(!jsonDict.valueForKey("current_observation").valueForKey("icon_url") ||
                !jsonDict.valueForKey("current_observation").valueForKey("forecast_url") ||
                !jsonDict.valueForKey("current_observation").valueForKey("temp_c")){
                
                    let userInfo:[NSObject:String] = [NSLocalizedDescriptionKey:"JSON not correct",NSLocalizedFailureReasonErrorKey:"JSON not correct",NSLocalizedRecoverySuggestionErrorKey:"JSON not correct"];
                    
                    error = NSError(domain: "WheatherApp", code: 500, userInfo: userInfo);
                    
                completionClosure(weather: nil, error: error);
            }else{
                
                let urlImage = jsonDict.valueForKey("current_observation").valueForKey("icon_url") as String;
                let forecastUrl = jsonDict.valueForKey("current_observation").valueForKey("forecast_url") as String;
                let tempCelsious = jsonDict.valueForKey("current_observation").valueForKey("temp_c") as Double;
                
                completionClosure(weather:Weather(urlImage: urlImage, tempCelsius: tempCelsious, forecastUrl: forecastUrl),error:error);
            }
            
            
        });
        
    }
    
    
}