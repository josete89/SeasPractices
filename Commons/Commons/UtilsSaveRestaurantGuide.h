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

//Save
+(BOOL)saveRestaurantGuide:(RestauranGuide*)restaurantGuide;
+(BOOL)saveTemporaryRestaurantGuide:(RestauranGuide*)restaurantGuide;

//Delete
+(BOOL)removeRestaurantGuide:(RestauranGuide*)restaurantGuide;
+(BOOL)removeTempResturantGuide:(RestauranGuide*)restaurantGuide;

//List
+(NSArray*)restoreRestaurantGuides;
+(RestauranGuide*)recoveryFromTempDir;

@end
