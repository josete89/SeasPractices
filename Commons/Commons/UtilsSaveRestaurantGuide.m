//
//  UtilsSaveRestaurantGuide.m
//  Commons
//
//  Created by Jose Luis Alcala Ramos on 10/07/14.
//  Copyright (c) 2014 Seas. All rights reserved.
//

#import "UtilsSaveRestaurantGuide.h"

@implementation UtilsSaveRestaurantGuide


+(BOOL)saveRestaurantGuide:(RestauranGuide*)restaurantGuide{
    return [self saveRestaurantGuide:restaurantGuide inPath:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]];
}
+(BOOL)saveTemporaryRestaurantGuide:(RestauranGuide*)restaurantGuide{
    return [self saveRestaurantGuide:restaurantGuide inPath:NSTemporaryDirectory()];
}

+(BOOL)saveRestaurantGuide:(RestauranGuide*)restaurantGuide inPath:(NSString*)directory{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError* error;
    NSString *fileName = [restaurantGuide.name stringByAppendingPathExtension:@"data"];
    
    NSString* path = [directory stringByAppendingPathComponent:fileName];
    
    if([fileManager fileExistsAtPath:path isDirectory:NO]){
        NSLog(@"File exist,proceded update");
        [fileManager removeItemAtPath:path error:&error];
        if (error.description) {
            NSLog(@"Cant removeFile %@",error.description);
            return NO;
        }
        return [[restaurantGuide toDictionary]writeToFile:path atomically:YES];
    }else{
       return [[restaurantGuide toDictionary]writeToFile:path atomically:YES];
    }
    
}

+(BOOL)removeRestaurantGuide:(RestauranGuide*)restaurantGuide{
    NSString* directory = [NSHomeDirectory() stringByAppendingPathComponent:
                      @"Documents"];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSError* error;
    NSString *fileName = [restaurantGuide.name stringByAppendingPathExtension:@"data"];
    NSString* path = [directory stringByAppendingPathComponent:fileName];
    [fileManager removeItemAtPath:path error:&error];
    
    if (error.description) {
        NSLog(@"Cant removeFile %@",error.description);
        return NO;
    }else{
        return YES;
    }
    
}

+(NSArray*)restoreRestaurantGuides{
    
    NSMutableArray* restaurantGuidesArray = [NSMutableArray array];
    NSString* path = [NSHomeDirectory() stringByAppendingPathComponent:
                      @"Documents"];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSDictionary* dictonary;
    
    for (NSString* file in [fileManager contentsOfDirectoryAtPath:path error:nil]) {
        if ([file hasSuffix:@".data"]) {
            dictonary = [NSDictionary dictionaryWithContentsOfFile:[path stringByAppendingPathComponent:file]];
            [restaurantGuidesArray addObject:[RestauranGuide populateFromDictionary:dictonary]];
        }
    }
    
    return [restaurantGuidesArray copy];
    
}

+(RestauranGuide*)recoveryFromTempDir{
   
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSDictionary* dictonary;
    NSString* completePath;
    for (NSString* file in [fileManager contentsOfDirectoryAtPath:NSTemporaryDirectory() error:nil]) {
        if ([file hasSuffix:@".data"]) {
            completePath = [NSTemporaryDirectory() stringByAppendingPathComponent:file];
            dictonary = [NSDictionary dictionaryWithContentsOfFile:completePath];
            [fileManager removeItemAtPath:completePath error:nil];
            return [RestauranGuide populateFromDictionary:dictonary];
        }
    }
    
    return nil;
}


@end
