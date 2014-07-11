//
//  NSUserDefaultsHelper.h
//  Ejercicios
//
//  Created by nacho on 09/07/14.
//  Copyright (c) 2014 SEAS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaultsHelper : NSObject

+ (void) guardarLugares:(NSArray *)lugares;
+ (NSArray *) obtenerLugares;
@end
