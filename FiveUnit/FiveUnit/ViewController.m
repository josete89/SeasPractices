//
//  ViewController.m
//  FiveUnit
//
//  Created by Jose Luis Alcala Ramos on 11/07/14.
//  Copyright (c) 2014 Seas. All rights reserved.
//

#import "ViewController.h"
#import "ServiciosWeb.h"
@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [ServiciosWeb invocarGooglePlacesAPIconLatitud:41.648790800000000000 yLongitud:-0.889581099999986700];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
