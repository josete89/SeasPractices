//
//  CityTableViewController.swift
//  TenUnit_SecondPractice
//
//  Created by Jose Luis Alcala Ramos on 11/07/14.
//  Copyright (c) 2014 Seas. All rights reserved.
//

import UIKit

class CityTableViewController: UITableViewController {
    
    let weatherCountries:[String:String] = ["San Francisco":"CA,San_Francisco","Zaragoza":"ES,Zaragoza","Madrid":"ES,Madrid","Paris":"FR,Paris"];
    
    var weatherCities = [String]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for city in self.weatherCountries.keys {
            weatherCities.append(city);
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1;
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("WeatherCell") as UITableViewCell;
        
        cell.textLabel.text = self.weatherCities[indexPath.row];
        
        return cell;
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int{
        return self.weatherCountries.count;
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        self.performSegueWithIdentifier("DetailSegue", sender: indexPath);
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        
        if(segue.identifier == "DetailSegue"){
            let destVC:WeatherViewController = segue.destinationViewController as WeatherViewController;
            destVC.codeCountryCity = self.weatherCountries[self.weatherCities[sender.row]]!;
            destVC.city = self.weatherCities[sender.row];
        }
        
    }
    
}
