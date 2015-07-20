//
//  ConnectWS.m
//  Restaurante
//
//  Created by MPAZ on 20/07/15.
//  Copyright (c) 2015 MPAZ. All rights reserved.
//

#import "ConnectWS.h"
#import <AFNetworking.h>

NSString *const kCode=@"text/html";
NSString *const kError=@"Error: %@";

@implementation ConnectWS
+ (ConnectWS *)sharedInstance{
    static ConnectWS *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[ConnectWS alloc] init];
    });
    return _sharedInstance;
}

- (void) getDataFromWebServices:(NSString *)pathUrl blockResponse:(void(^)(id response))handler{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:kCode];
    [manager GET:pathUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject){
        handler(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(kError, error);
    }];
    
}


@end
