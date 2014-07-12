//
//  SmilerViewController.m
//  SecondUnit_SecondPractice
//
//  Created by Jose Luis Alcala Ramos on 09/07/14.
//  Copyright (c) 2014 Seas. All rights reserved.
//

#import "SmilerViewController.h"

@interface SmilerViewController ()

@property (weak, nonatomic) IBOutlet SmilerFace *smilerFace;

@end

@implementation SmilerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    switch (self.smileType) {
        case HappyFace:
            self.title = @"Me gusta";
            break;
        case SeriousFace:
            self.title = @"No esta mal";
            break;
        case SadFace:
            self.title = @"No me gusta";
            break;
    }
    
    self.smilerFace.smile=self.smileType;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
