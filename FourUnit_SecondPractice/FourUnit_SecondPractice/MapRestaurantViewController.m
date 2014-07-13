//
//  MapRestaurantViewController.m
//  FourUnit_SecondPractice
//
//  Created by Jose Luis Alcala Ramos on 11/07/14.
//  Copyright (c) 2014 Seas. All rights reserved.
//

#import "MapRestaurantViewController.h"
#import "Commons/UtilsSaveRestaurantGuide.h"
#import "RestaurantAnnotation.h"


@implementation MapRestaurantViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSArray* restaurantGuides = [UtilsSaveRestaurantGuide restoreRestaurantGuides];
    NSMutableArray *annotations = [NSMutableArray arrayWithCapacity:restaurantGuides.count];
    RestaurantAnnotation* annotation;
    UIImage *image;
    for (RestauranGuide* guide in restaurantGuides) {
        image = [[UIImage alloc]initWithData:guide.photgraph];
        annotation = [[RestaurantAnnotation alloc]initWithCoordinates:CLLocationCoordinate2DMake(guide.latitude.doubleValue,guide.longuitude.doubleValue) andTitle:guide.name andSubtitle:guide.telephone andImage:image];
        [annotations addObject:annotation];
    }
    
    //Zooms to first RestaurantAnnotation
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(((RestaurantAnnotation*)[annotations firstObject]).coordinate, 2000, 2000);
    [_mapView setRegion:viewRegion animated:YES];
    
    [self.mapView addAnnotations:annotations.copy];
    
    self.mapView.delegate = self;
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    if ([annotation isKindOfClass:[RestaurantAnnotation class]]) {
        //Intents dequeue an existing pin view
        MKPinAnnotationView* pinView = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        if (!pinView)
        {
            // If an existing pin view was not available, create one.
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                      reuseIdentifier:@"CustomPinAnnotationView"];
            pinView.pinColor = MKPinAnnotationColorPurple;
            pinView.animatesDrop = YES;
            pinView.canShowCallout = YES;
            
            // If appropriate, customize by adding accessory views
            UIImageView *imageView = [[UIImageView alloc] initWithImage:((RestaurantAnnotation*)annotation).image];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            [imageView setFrame:CGRectMake(0, 0, 50, 50)];
            pinView.leftCalloutAccessoryView = imageView;
            
        } else{
            pinView.annotation = annotation;
        }
        
        return pinView;
    }
    return nil;
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
