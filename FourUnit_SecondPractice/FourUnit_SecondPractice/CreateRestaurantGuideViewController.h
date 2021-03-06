//
//  CreateRestaurantGuideViewController.h
//  ThirdUnit_FirstPractice
//
//  Created by Jose Luis Alcala Ramos on 10/07/14.
//  Copyright (c) 2014 Seas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Commons/UtilsSaveRestaurantGuide.h"

@interface CreateRestaurantGuideViewController : UIViewController<UITextFieldDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate,UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *telephoneTextField;

@property (weak, nonatomic) IBOutlet SmilerFace *happyView;
@property (weak, nonatomic) IBOutlet SmilerFace *seriousView;
@property (weak, nonatomic) IBOutlet SmilerFace *sadView;

@property (weak, nonatomic) IBOutlet UIButton *happyButton;
@property (weak, nonatomic) IBOutlet UIButton *seriousButton;
@property (weak, nonatomic) IBOutlet UIButton *sadButton;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property BOOL alertDontAppear;
@property BOOL restoreFromTemp;
@property (weak, nonatomic) IBOutlet UIButton *photoButton;

@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *longuitudeTextField;

-(RestauranGuide*)populateRestaurnatGuide;
-(IBAction)saveButton:(id)sender;

@end
