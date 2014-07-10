//
//  PruebaConsola.m
//  Ejercicios
//
//  Created by nacho on 08/07/14.
//  Copyright (c) 2014 SEAS. All rights reserved.
//

#import "PruebaConsola.h"

@implementation PruebaConsola

+ (void) saludar:(NSString *)nombre {
    
    /* Esta invocación escribirá por consola "Hola <nombre>" siendo nombre el valor que viene
       como parámetro*/
    NSLog(@"Hola %@",nombre);
    // Esto es un comentario de una línea.
}
@end
