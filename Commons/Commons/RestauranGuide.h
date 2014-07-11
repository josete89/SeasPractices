//
//  RestauranGuide.h
//  Commons
//
//  Created by Jose Luis Alcala Ramos on 10/07/14.
//  Copyright (c) 2014 Seas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SmilerFace.h"

@interface RestauranGuide : NSObject

@property NSString* name;
@property NSString* telephone;
@property SmileType experience;
@property NSData* photgraph;
@property NSNumber* latitude;
@property NSNumber* longuitude;

-(instancetype)initWithName:(NSString*)name andTelephone:(NSString*)telephone andExperience:(SmileType)smilerType;

-(instancetype)initWithName:(NSString*)name andTelephone:(NSString*)telephone andExperience:(SmileType)smilerType andPhtograph:(NSData*)photo;

-(instancetype)initWithName:(NSString*)name andTelephone:(NSString*)telephone andExperience:(SmileType)smilerType andPhtograph:(NSData*)photo andLatitude:(NSNumber*)latitude andLoguitude:(NSNumber*)longuitude;

-(NSDictionary*)toDictionary;

+(RestauranGuide*)populateFromDictionary:(NSDictionary*)dictionary;

@end
