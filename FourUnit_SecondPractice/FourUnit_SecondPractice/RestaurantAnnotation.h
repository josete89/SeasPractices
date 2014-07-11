//
//  RestaurantAnnotation.h
//  FourUnit_SecondPractice
//
//  Created by Jose Luis Alcala Ramos on 11/07/14.
//  Copyright (c) 2014 Seas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface RestaurantAnnotation : NSObject

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;
@property (nonatomic, readonly) UIImage  *image;

-(instancetype)initWithCoordinates:(CLLocationCoordinate2D)coordinatesc andTitle:(NSString*)title andSubtitle:(NSString*)subtitle andImage:(UIImage*)restImage;

@end
