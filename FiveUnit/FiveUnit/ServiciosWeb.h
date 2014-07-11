//
//  ServiciosWeb.h
//  Ejercicios
//
//  Created by nacho on 09/07/14.
//  Copyright (c) 2014 SEAS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiciosWeb : NSObject

+ (void) invocarGooglePlacesAPIconLatitud:(float)latitud yLongitud:(float)longitud;

+ (void) descargarImagen:(NSString *)referencia;

@end
