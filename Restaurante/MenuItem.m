//
//  MenuItem.m
//  Restaurante
//
//  Created by MPAZ on 21/07/15.
//  Copyright (c) 2015 MPAZ. All rights reserved.
//

#import "MenuItem.h"

@implementation MenuItem

- (instancetype)initWithTitle:(NSString *)name precio:(NSString *)precio imagenUrl:(NSString *)imagenUrl{
    self= [super init];
    
    if(self){
        _name= name;
        _precio= precio;
        _imagenUrl= imagenUrl;
        
    }
    
    return self;

}

@end
