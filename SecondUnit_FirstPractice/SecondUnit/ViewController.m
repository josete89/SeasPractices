//
//  ViewController.m
//  SecondUnit
//
//  Created by Jose Luis  on 03/07/14.
//  Copyright (c) 2014 Seas. All rights reserved.
//

#import "ViewController.h"
#import "Commons/SmilerFace.h"

@interface ViewController ()
            
@property (weak, nonatomic) IBOutlet SmilerFace *smilerFaceView;

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Happy face
    _smilerFaceView.smile = HappyFace;
    
    //Serious face
    //_smilerFaceView.smile = SeriousFace;
    
    //Sad face
    //_smilerFaceView.smile = SadFace;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
