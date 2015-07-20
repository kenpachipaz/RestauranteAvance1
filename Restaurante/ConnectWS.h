//
//  ConnectWS.h
//  Restaurante
//
//  Created by MPAZ on 20/07/15.
//  Copyright (c) 2015 MPAZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConnectWS : NSObject

@property (nonatomic, strong)NSArray *response;

+ (ConnectWS *)sharedInstance;
- (void) getDataFromWebServices:(NSString *)pathUrl blockResponse:(void (^) (id response))handler;
@end
