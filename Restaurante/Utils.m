//
//  Utils.m
//  Restaurante
//
//  Created by MPAZ on 20/07/15.
//  Copyright (c) 2015 MPAZ. All rights reserved.
//

#import "Utils.h"
#import <UIKit/UIKit.h>
#import "ConnectWS.h"
#import "MenuItem.h"
#import "Reservaciones.h"

NSString *const kUrlBase=@"http://takephotos.hol.es/WebCamPicture/API/";

NSString *const kApiValidate=@"validate_user.php?";
NSString *const kUser=@"usuario=";
NSString *const kPassword=@"&password=";

NSString *const kApiMenu=@"get_menu.php?";
NSString *const kSection=@"seccion=";

NSString *const kApiReservation=@"reservation_table.php?";
NSString *const kMesa=@"&mesa=";
NSString *const kFechaR=@"&fecha=";

NSString *const kApiStatus=@"status_table.php?";
NSString *const kFecha=@"fecha=";

NSString *const kApiDelete=@"delete_reservation.php?";
NSString *const kID=@"id=";

NSString *const kApiMyReservations=@"my_reservations.php?";

NSString *const kTitle=@"Alerta";
NSString *const kAcepter=@"Aceptar";

@implementation Utils


+ (NSString *) getValidateUrl:(NSString *)user password:(NSString *)password{
    return [kUrlBase stringByAppendingFormat:@"%@%@%@%@%@",kApiValidate, kUser, user, kPassword, password];
}

+ (NSString *) getMenuUrl:(NSString *)section{
    return [kUrlBase stringByAppendingFormat:@"%@%@%@",kApiMenu, kSection, section];
}

+ (NSString *) getReservacionesUrl:(NSString *)user mesa:(NSString *)mesa fecha:(NSString *)fecha{
    return [kUrlBase stringByAppendingFormat:@"%@%@%@%@%@%@%@",kApiReservation, kUser, user,kMesa,mesa,kFechaR,fecha];
}

+ (NSString *) getStatusMesasUrl:(NSString *)fecha{
    return [kUrlBase stringByAppendingFormat:@"%@%@%@",kApiStatus, kFecha, fecha];
}

+ (NSString *) getDeleteUrl:(NSString *)id_mesa{
    return [kUrlBase stringByAppendingFormat:@"%@%@%@",kApiDelete, kID, id_mesa];
}

+ (NSString *) getMyReservationsUrl:(NSString *)user{
    return [kUrlBase stringByAppendingFormat:@"%@%@%@",kApiMyReservations, kUser, user];
}

+ (void) showAlertMessage:(NSString *)msg{
    UIAlertView *alert= [[UIAlertView alloc]
                         initWithTitle
                         :kTitle
                         message:msg
                         delegate:self
                         cancelButtonTitle:kAcepter otherButtonTitles:nil];
    
    [alert show];
}

+ (NSArray *)getMenuArray:(NSString *)Url{
    NSMutableArray *menuMutable = [[NSMutableArray alloc]init];
    NSArray *menu =[[ConnectWS sharedInstance]getDataFromWebServices:Url];
         for (int i=0; i< menu.count; i++) {
             NSDictionary *menuDictionary = [menu objectAtIndex:i];
             MenuItem *menuItem = [[MenuItem alloc]initWithTitle:menuDictionary[@"nombre"] precio:menuDictionary[@"precio"] imagenUrl:menuDictionary[@"imagen"]];
        [menuMutable addObject:menuItem];
    }
    return menuMutable;
}

+ (id)getReservacionesArray:(NSString *)Url{
    id data =[[ConnectWS sharedInstance]getDataFromWebServices:Url];
    
    if([data isKindOfClass:[NSArray class]]){
        NSMutableArray *menuMutable = [[NSMutableArray alloc]init];
        NSArray *menu=data;
        for (int i=0; i< menu.count; i++) {
        
            NSDictionary *reservacionesDictionary = [menu objectAtIndex:i];
            
            Reservaciones *reservacionesItem = [[Reservaciones alloc]initWithTitle:reservacionesDictionary[@"id"] mesa:reservacionesDictionary[@"mesa"] usuario:reservacionesDictionary[@"usuario"] fecha:reservacionesDictionary[@"fecha"]];
        
            [menuMutable addObject:reservacionesItem];
        }
        return menuMutable;
    }else{
        return data[@"msg"];
    }
}
@end
