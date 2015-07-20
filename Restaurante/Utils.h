//
//  Utils.h
//  Restaurante
//
//  Created by MPAZ on 20/07/15.
//  Copyright (c) 2015 MPAZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+ (NSString *) getValidateUrl:(NSString *)user password:(NSString *)password;
+ (NSString *) getMenuUrl:(NSString *)section;
+ (NSString *) getReservacionesUrl:(NSString *)user;
+ (NSString *) getStatusMesasUrl:(NSString *)fecha;
+ (NSString *) getDeleteUrl:(NSString *)id_mesa;
+ (NSString *) getMyReservationsUrl:(NSString *)user;
+ (void) showAlertMessage:(NSString *)msg;
@end
