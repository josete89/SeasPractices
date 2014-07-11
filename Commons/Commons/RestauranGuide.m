//
//  RestauranGuide.m
//  Commons
//
//  Created by Jose Luis Alcala Ramos on 10/07/14.
//  Copyright (c) 2014 Seas. All rights reserved.
//

#import "RestauranGuide.h"

#define NAME_KEY       @"name"
#define TELEPHONE_KEY  @"telephone"
#define EXPERIENCE_KEY @"experience"
#define PHOTOGRAPH_KEY @"photgraph"
#define LATITUDE_KEY   @"latitude"
#define LONGUITUDE_KEY @"longuitude"

@implementation RestauranGuide


#pragma mark Constructors
-(instancetype)initWithName:(NSString*)name andTelephone:(NSString*)telephone andExperience:(SmileType)smilerType{
    
    self = [super init];
    if(self){
        self.name = name;
        self.telephone = telephone;
        self.experience = smilerType;
    }
    
    return self;
}

-(instancetype)initWithName:(NSString*)name andTelephone:(NSString*)telephone andExperience:(SmileType)smilerType andPhtograph:(NSData*)photo{
    
    self = [self initWithName:name andTelephone:telephone andExperience:smilerType];
    if(self){
        self.photgraph = photo;
    }
    
    return self;
}

-(instancetype)initWithName:(NSString*)name andTelephone:(NSString*)telephone andExperience:(SmileType)smilerType andPhtograph:(NSData*)photo andLatitude:(NSNumber*)latitude andLoguitude:(NSNumber*)longuitude{
    
    self = [self initWithName:name andTelephone:telephone andExperience:smilerType andPhtograph:photo];
    if(self){
        self.latitude = latitude;
        self.longuitude = longuitude;
    }
    
    return self;
}

#pragma mark Utility methods
-(NSDictionary*)toDictionary{
    
    NSMutableDictionary* mutableDictionary = [NSMutableDictionary dictionaryWithCapacity:4];
    
    if(_name) [mutableDictionary setValue:self.name forKey:NAME_KEY];
    if(_telephone) [mutableDictionary setValue:self.telephone forKey:TELEPHONE_KEY];
    if(_experience) [mutableDictionary setValue:[NSNumber numberWithInt:self.experience] forKey:EXPERIENCE_KEY];
    if(_photgraph) [mutableDictionary setValue:self.photgraph forKey:PHOTOGRAPH_KEY];
    if(_latitude) [mutableDictionary setValue:self.latitude forKey:LATITUDE_KEY];
    if(_longuitude) [mutableDictionary setValue:self.longuitude forKey:LONGUITUDE_KEY];
    
    return [mutableDictionary copy];
}

+(RestauranGuide*)populateFromDictionary:(NSDictionary*)dictionary{
    
    RestauranGuide *restaurantGuide = [[RestauranGuide alloc]init];
    
    NSString* name       = [dictionary valueForKey:NAME_KEY];
    NSString* telephone  = [dictionary valueForKey:TELEPHONE_KEY];
    SmileType experience = ((NSNumber*)[dictionary valueForKey:EXPERIENCE_KEY]).integerValue;
    NSData* photgraph  = [dictionary valueForKey:PHOTOGRAPH_KEY];
    NSNumber* latitude   = [dictionary valueForKey:LATITUDE_KEY];
    NSNumber* longuitude = [dictionary valueForKey:LONGUITUDE_KEY];;
    
    
    if(name){
        restaurantGuide.name =name;
    }
    if(telephone){
        restaurantGuide.telephone  = telephone;
    }
    if(experience){
        restaurantGuide.experience = experience;
    }
    if(photgraph){
        restaurantGuide.photgraph  = photgraph;
    }
    if(latitude){
        restaurantGuide.latitude   = latitude;
    }
    if(longuitude){
        restaurantGuide.longuitude = longuitude;
    }
    
    
    return restaurantGuide;
}




@end
