//
//  UtilsSaveRestaurantGuide.h
//  Commons
//
//  Created by Jose Luis Alcala Ramos on 10/07/14.
//  Copyright (c) 2014 Seas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestauranGuide.h"

@interface UtilsSaveRestaurantGuide : NSObject


+(BOOL)saveRestaurantGuide:(RestauranGuide*)restaurantGuide;
+(BOOL)saveTemporaryRestaurantGuide:(RestauranGuide*)restaurantGuide;

+(NSArray*)restoreRestaurantGuides;
+(RestauranGuide*)recoveryFromTempDir;

@end
