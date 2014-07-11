//
//  RestaurantAnnotation.m
//  FourUnit_SecondPractice
//
//  Created by Jose Luis Alcala Ramos on 11/07/14.
//  Copyright (c) 2014 Seas. All rights reserved.
//

#import "RestaurantAnnotation.h"

@implementation RestaurantAnnotation

-(instancetype)initWithCoordinates:(CLLocationCoordinate2D)coordinatesc andTitle:(NSString*)title andSubtitle:(NSString*)subtitle andImage:(UIImage*)restImage{
    
    self = [super init];
    if (self) {
        _coordinate = coordinatesc;
        _title = title;
        _subtitle = subtitle;
        _image = restImage;
    }
    return self;
}


@end
