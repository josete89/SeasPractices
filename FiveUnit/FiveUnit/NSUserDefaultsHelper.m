//
//  NSUserDefaultsHelper.m
//  Ejercicios
//
//  Created by nacho on 09/07/14.
//  Copyright (c) 2014 SEAS. All rights reserved.
//

#import "NSUserDefaultsHelper.h"

@implementation NSUserDefaultsHelper

+ (void) guardarLugares:(NSArray *)lugares {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:lugares forKey:@"lugares"];
    [defaults synchronize];
}

+ (NSArray *) obtenerLugares {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:@"lugares"];
}

@end
