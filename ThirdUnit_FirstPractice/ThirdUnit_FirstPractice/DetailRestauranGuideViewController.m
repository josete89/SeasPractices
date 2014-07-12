//
//  DetailRestauranGuideViewController.m
//  ThirdUnit_FirstPractice
//
//  Created by Jose Luis Alcala Ramos on 10/07/14.
//  Copyright (c) 2014 Seas. All rights reserved.
//

#import "DetailRestauranGuideViewController.h"

@interface DetailRestauranGuideViewController ()

@end

@implementation DetailRestauranGuideViewController

- (void)viewDidLoad {
    //Prevents see recovery message in edition
    self.alertDontAppear = YES;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //For resave temp
    if (self.restoreFromTemp) {
        RestauranGuide* rest  = [self populateRestaurnatGuide];
        [UtilsSaveRestaurantGuide saveTemporaryRestaurantGuide:rest];
    }
    
    self.title = _restauranGuide.name;
    
    self.nameTextField.text = _restauranGuide.name;
    self.telephoneTextField.text = _restauranGuide.telephone;
    
    switch (_restauranGuide.experience) {
        case HappyFace:
            [self.happyButton setSelected:YES];
            break;
        case SeriousFace:
            [self.seriousButton setSelected:YES];
            break;
        case SadFace:
            [self.sadButton setSelected:YES];
            break;
    }
    
}

- (IBAction)saveButton:(id)sender {
    
    if(![self.restauranGuide.name isEqualToString:self.nameTextField.text]){
        [UtilsSaveRestaurantGuide removeRestaurantGuide:self.restauranGuide];
    }
    
    [super saveButton:sender];
    
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
