//
//  ViewController.m
//  FirstUnit
//
//  Created by Jose Luis  on 03/07/14.
//  Copyright (c) 2014 Seas. All rights reserved.
//

#import "ViewController.h"
#import "PruebaConsola.h"

@interface ViewController ()
            

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *miNombre = @"Nacho";
    
    [PruebaConsola saludar:miNombre];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
