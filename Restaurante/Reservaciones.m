//
//  Reservaciones.m
//  Restaurante
//
//  Created by MPAZ on 22/07/15.
//  Copyright (c) 2015 MPAZ. All rights reserved.
//

#import "Reservaciones.h"

@implementation Reservaciones

-(instancetype)initWithTitle:(NSString *)idMesa mesa:(NSString *)mesa usuario:(NSString *)usuario fecha:(NSString *)fecha{
    
    self =[super init];
    
    if (self) {
        _idMesa=idMesa;
        _mesa=mesa;
        _usuario=usuario;
        _fecha=fecha;
    }
    return self;

}
@end
