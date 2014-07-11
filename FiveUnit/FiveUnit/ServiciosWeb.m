//
//  ServiciosWeb.m
//  Ejercicios
//
//  Created by nacho on 09/07/14.
//  Copyright (c) 2014 SEAS. All rights reserved.
//

#import "ServiciosWeb.h"
#import "NSUserDefaultsHelper.h"

#define API_GOOGLE_KEY @"AIzaSyA1D7Q4CcYGvpCXyfVxOEaI8RHPyklQ3OM"

@implementation ServiciosWeb

+ (void) invocarGooglePlacesAPIconLatitud:(float)latitud yLongitud:(float)longitud {

    // Tipo de lugar según se explica en la documentación de la API
    NSString *tipoDeLugar = @"restaurant";
    
    // APIKey creada en la consola de desarrollador de Google
    //NSString *API_GOOGLE_KEY = @"AIzaSyA1D7Q4CcYGvpCXyfVxOEaI8RHPyklQ3OM";

    // URL del servicio de Google Places
    NSString *url = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/search/json?location=%f,%f&radius=500&types=%@&sensor=true&key=%@", latitud, longitud, tipoDeLugar, API_GOOGLE_KEY];
    
    // Crear URL a base de la anterior
    NSURL *googleRequestURL=[NSURL URLWithString:url];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:googleRequestURL];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // Realizar la petición
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if ([data length] > 0 && error == nil) {
            // Se han recibido datos
            NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data
                                  options:kNilOptions
                                  error:&error];
            
            NSArray* lugares = [json objectForKey:@"results"];
            [NSUserDefaultsHelper guardarLugares:lugares];
            
            NSArray *lugaresRecuperados = [NSUserDefaultsHelper obtenerLugares];
            NSLog(@"Datos almacenados: %@", lugaresRecuperados);
            
            /*for(NSDictionary *lugar in places) {
                [self descargarImagen:[lugar valueForKey:@"reference"]];
            }*/
            
            //NSDictionary *lugar = [places objectAtIndex:0];
            //[self descargarImagen:@"CoQBgAAAACIoa0W0ijCMESp-vDiA-Vamcna7TV5QML2LonJvNhk7PsU2oxI2uCEMnINlXt0SHQ2Lm9DeTubA1pzoOj1kqLyIWTzMcSEPDP6l3z7_dmkt2Wqb-a5MZPb4p-pjw2RWSkPzSCuwajcSWVD8COtbIh3njD3rSSSPG8cXy2gqXFyVEhC0EoMViVlFkasqb_yyl19BGhSMnM-SV0MPB66D-rPMhtOVmonyjQ"];
            
            //NSLog(@"Datos recibidos: %@", places);
        } else if ([data length] == 0 && error == nil) {
            // No se han recibido datos
            NSLog(@"Datos NO recibidos");
        } else if (error != nil) {
            // Ha ocurrido algún otro error
            NSLog(@"Ha ocurrido un error");
        }
    }];
    
}

+ (void) descargarImagen:(NSString *)referencia {
    
    // URL de la imagen
    NSString *urlString = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/photo?maxwidth=%i&photoreference=%@&sensor=false&key=%@",500,referencia, API_GOOGLE_KEY];
    NSLog(@"Imagen a descargar de %@",urlString);
    NSURL *laURL = [NSURL URLWithString:urlString];
    
    // Petición y sesión
    NSURLRequest *laPeticion = [NSURLRequest requestWithURL:laURL];
    NSURLSession *laSesion = [NSURLSession sharedSession];
    
    // Descarga
    NSURLSessionDownloadTask *downloadTask =
    [laSesion downloadTaskWithRequest:laPeticion completionHandler:
    ^(NSURL *location, NSURLResponse *response, NSError *error) {
        
        if (error == nil) {
            
            // Descarga correcta. Guardar
            
            NSLog(@"Archivo temporal =%@",location);
            
            NSError *err = nil;
            NSFileManager *fileManager = [NSFileManager defaultManager];
            NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            
            NSURL *documentsDirectoryURL = [NSURL fileURLWithPath:[documentsPath stringByAppendingPathComponent:@"imagen.png"]];
            if ([fileManager moveItemAtURL:location
                                     toURL:documentsDirectoryURL
                                     error: &err])
            {
                NSLog(@"Archivo guardado en %@",documentsDirectoryURL);
            }
            else
            {
                NSLog(@"No se ha podido guardar en %@",[err userInfo]);
            }
            
        
        } else {
            // Descarga incorrecta
            NSLog(@"Error: %@",[error localizedDescription]);
        }
    }];
    
    [downloadTask resume];
}

@end
