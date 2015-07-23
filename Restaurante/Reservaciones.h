//
//  Reservaciones.h
//  Restaurante
//
//  Created by MPAZ on 22/07/15.
//  Copyright (c) 2015 MPAZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Reservaciones : NSObject
@property (nonatomic, copy) NSString *idMesa;
@property (nonatomic, copy) NSString *mesa;
@property (nonatomic, copy) NSString *usuario;
@property (nonatomic, copy) NSString *fecha;

- (instancetype)initWithTitle:(NSString *)idMesa mesa:(NSString *)mesa usuario:(NSString *)usuario fecha:(NSString *)fecha;
@end
