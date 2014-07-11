//
//  ViewController.m
//  SecondUnit_SecondPractice
//
//  Created by Jose Luis Alcala Ramos on 09/07/14.
//  Copyright (c) 2014 Seas. All rights reserved.
//

#import "ViewController.h"
#import "SmilerViewController.h"
#import "Commons/SmilerFace.h"
@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSString* identifier = segue.identifier;
    SmilerViewController* destinationController = segue.destinationViewController;
    if ([identifier hasSuffix:@"Happy"]) {
        destinationController.smileType= HappyFace;
    }else if ([identifier hasSuffix:@"Serious"]){
        destinationController.smileType = SeriousFace;
    }else if([identifier hasSuffix:@"Sad"]){
        destinationController.smileType = SadFace;
    }
    
}

@end
