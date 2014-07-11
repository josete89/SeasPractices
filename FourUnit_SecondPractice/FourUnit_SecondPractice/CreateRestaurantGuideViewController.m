//
//  CreateRestaurantGuideViewController.m
//  ThirdUnit_FirstPractice
//
//  Created by Jose Luis Alcala Ramos on 10/07/14.
//  Copyright (c) 2014 Seas. All rights reserved.
//

#import "CreateRestaurantGuideViewController.h"

@class CreateRestaurantGuideViewController;

@interface CreateRestaurantGuideViewController ()

@end

@implementation CreateRestaurantGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    RestauranGuide *rest = [UtilsSaveRestaurantGuide recoveryFromTempDir];
    
    if (rest) {
        _nameTextField.text = rest.name;
        _telephoneTextField.text = rest.telephone;
        switch (rest.experience) {
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
        self.restoreFromTemp = YES;
    }
    
    if (self.restoreFromTemp && [self isKindOfClass:[CreateRestaurantGuideViewController class]]){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Guia de restaurantes" message:@"Se ah recuperado una ficha" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
    
    _happyView.smile = HappyFace;
    _seriousView.smile = SeriousFace;
    _sadView.smile = SadFace;
    
    _nameTextField.delegate = self;
    _telephoneTextField.delegate = self;
    _latitudeTextField.delegate = self;
    _longuitudeTextField.delegate = self;
    _imageView.hidden = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveTempState) name:UIApplicationWillResignActiveNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)saveTempState{
    RestauranGuide* restaurant = [self populateRestaurnatGuide];
    if (restaurant.name) {
        [UtilsSaveRestaurantGuide saveTemporaryRestaurantGuide:restaurant];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return YES;
}

- (IBAction)touchILikedButton:(id)sender {
    
    if (!self.happyButton.isSelected) {
        [self.happyButton setSelected:YES];
        [self.seriousButton setSelected:NO];
        [self.sadButton setSelected:NO];
    }
    
}
- (IBAction)touchNotBadButton:(id)sender {
    if (!self.seriousButton.isSelected) {
        [self.seriousButton setSelected:YES];
        [self.happyButton setSelected:NO];
        [self.sadButton setSelected:NO];
    }
}
- (IBAction)touchIdontLikeButton:(id)sender {
    if (!self.sadButton.isSelected) {
        [self.sadButton setSelected:YES];
        [self.seriousButton setSelected:NO];
        [self.happyButton setSelected:NO];
    }
}

- (IBAction)saveButton:(id)sender {
    
    RestauranGuide* restaurantGuide = [self populateRestaurnatGuide];
    
     UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Guardando datos..."
                                        message:@"\n"
                                       delegate:self
                              cancelButtonTitle:nil
                              otherButtonTitles:nil];
    
    [alert show];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^(void){
        if ([UtilsSaveRestaurantGuide saveRestaurantGuide:restaurantGuide]){
            //Use because save operation is very fast
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [alert dismissWithClickedButtonIndex:0 animated:YES];
                [self.navigationController popViewControllerAnimated:YES];
            });
        }else{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [alert dismissWithClickedButtonIndex:0 animated:YES];
                UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:@"Guias de restaurantes" message:@"No se ha podido guradar la ficha,intentenlo de nuevo" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            
                [alertView show];
            });
        }
    });
    
    
    
    /*if ([UtilsSaveRestaurantGuide saveRestaurantGuide:restaurantGuide]){
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"Guias de restaurantes" message:@"No se ha podido guradar la ficha,intentenlo de nuevo" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        
        [alert show];
    }*/

}


-(RestauranGuide*)populateRestaurnatGuide{
    SmileType experience;
    
    if(self.happyButton.isSelected){
        experience = HappyFace;
    }else if (self.seriousButton.isSelected){
        experience = SeriousFace;
    }else if(self.sadButton.isSelected){
        experience = SadFace;
    }
    
    NSNumber* latitude = _latitudeTextField.text ? [NSNumber numberWithFloat:_latitudeTextField.text.floatValue] : @0;
    NSNumber* longuitude = _longuitudeTextField.text ? [NSNumber numberWithFloat:_longuitudeTextField.text.floatValue] : @0;
    
    RestauranGuide* restaurantGuide = [[RestauranGuide alloc]initWithName:_nameTextField.text andTelephone:_telephoneTextField.text andExperience:experience andPhtograph:UIImageJPEGRepresentation(_imageView.image, 1.0) andLatitude:latitude andLoguitude:longuitude];
    
    return restaurantGuide;
}

-(IBAction)touchSavePhoto:(UIButton*)sender{
    UIActionSheet *actionSheet = [UIActionSheet new];
    
    if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear]) {
        [actionSheet addButtonWithTitle:@"Tomar una foto"];
    }
    
    [actionSheet addButtonWithTitle:@"Elegir una foto"];
    if (_imageView.image) {
        [actionSheet addButtonWithTitle:@"Borrar foto"];
    }
    
    [actionSheet setCancelButtonIndex:[actionSheet addButtonWithTitle:@"Cancelar"]];
    [actionSheet setDelegate:self];
    
    
    [actionSheet showFromRect:sender.frame inView:self.view animated:YES];
}

#pragma mark - UIActionSheetDelegate methods

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if ([buttonTitle isEqualToString:@"Tomar una foto"]) {
        [self presentImagePickerForSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    else if ([buttonTitle isEqualToString:@"Elegir una foto"]) {
        [self presentImagePickerForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    }
    else if ([buttonTitle isEqualToString:@"Borrar foto"]) {
        _imageView.image = nil;
        [_photoButton setTitle:@"Añadir" forState:UIControlStateNormal];
    }
}

- (void)presentImagePickerForSourceType:(UIImagePickerControllerSourceType)sourceType
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = sourceType;
    picker.delegate = self;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self updateImage:info];
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)updateImage:(NSDictionary *)userInfo
{
    
    /*
     NSLog(@"OriginalImage : %@",[userInfo objectForKey:UIImagePickerControllerOriginalImage]);
     NSLog(@"EditedImage : %@",[userInfo objectForKey:UIImagePickerControllerEditedImage]);
     NSLog(@"CropRect : %@", NSStringFromCGRect([[userInfo objectForKey:UIImagePickerControllerCropRect] CGRectValue]));
     NSLog(@"MediaType : %@",[userInfo objectForKey:UIImagePickerControllerMediaType]);
     NSLog(@"ReferenceURL : %@",[userInfo objectForKey:UIImagePickerControllerReferenceURL]);
     */
    
    UIImage *image = [userInfo objectForKey:UIImagePickerControllerOriginalImage];
    
    if (_imageView.isHidden) {
        _imageView.hidden = NO;
    }
    [_photoButton setTitle:@"" forState:UIControlStateNormal];
    _imageView.image = image;
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
