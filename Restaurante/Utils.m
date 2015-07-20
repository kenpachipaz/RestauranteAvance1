//
//  Utils.m
//  Restaurante
//
//  Created by MPAZ on 20/07/15.
//  Copyright (c) 2015 MPAZ. All rights reserved.
//

#import "Utils.h"
#import <UIKit/UIKit.h>

NSString *const kUrlBase=@"http://takephotos.hol.es/WebCamPicture/API/";

NSString *const kApiValidate=@"validate_user.php?";
NSString *const kUser=@"usuario=";
NSString *const kPassword=@"&password=";

NSString *const kApiMenu=@"get_menu.php?";
NSString *const kSection=@"seccion=";

NSString *const kApiReservation=@"reservation_table.php?";

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

+ (NSString *) getReservacionesUrl:(NSString *)user{
    return [kUrlBase stringByAppendingFormat:@"%@%@%@",kApiReservation, kUser, user];
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
@end
