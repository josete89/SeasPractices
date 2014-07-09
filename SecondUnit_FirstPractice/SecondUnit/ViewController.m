//
//  ViewController.m
//  SecondUnit
//
//  Created by Jose Luis  on 03/07/14.
//  Copyright (c) 2014 Seas. All rights reserved.
//

#import "ViewController.h"
#import "SmilerFace.h"

@interface ViewController ()
            
@property (weak, nonatomic) IBOutlet SmilerFace *smilerFaceView;

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Happy face
    _smilerFaceView.smile = 1.0;
    
    //Serious face
    //_smilerFaceView.smile = 0.0;
    
    //Sad face
    //_smilerFaceView.smile = -1.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
