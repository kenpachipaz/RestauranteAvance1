//
//  MenuItem.h
//  Restaurante
//
//  Created by MPAZ on 21/07/15.
//  Copyright (c) 2015 MPAZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuItem : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *precio;
@property (nonatomic, copy) NSString *imagenUrl;

- (instancetype)initWithTitle:(NSString *)name precio:(NSString *)precio imagenUrl:(NSString *)imagenUrl;

@end
