//
//  MapRestaurantViewController.h
//  FourUnit_SecondPractice
//
//  Created by Jose Luis Alcala Ramos on 11/07/14.
//  Copyright (c) 2014 Seas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface MapRestaurantViewController : UIViewController<MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
