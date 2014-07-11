//
//  ViewController.swift
//  TenUnit_FIrstPractice
//
//  Created by Jose Luis Alcala Ramos on 11/07/14.
//  Copyright (c) 2014 Seas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressObject(sender: AnyObject) {
        var alert:UIAlertView = UIAlertView(title: "Swift", message: "Hola mundo", delegate: nil, cancelButtonTitle:"Ok");
        alert.show();
    }


}

