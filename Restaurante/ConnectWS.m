//
//  ConnectWS.m
//  Restaurante
//
//  Created by MPAZ on 20/07/15.
//  Copyright (c) 2015 MPAZ. All rights reserved.
//

#import "ConnectWS.h"
#import <AFNetworking.h>
#import "ViewController.h"

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

- (id) getDataFromWebServices:(NSString *)pathUrl{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:kCode];
    AFHTTPRequestOperation *operation=[manager GET:pathUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject){
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(kError, error);
    }];
    [operation start];
    [operation waitUntilFinished];
    return [operation responseObject];
}

@end
