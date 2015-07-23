//
//  Preferences.m
//  Restaurante
//
//  Created by MPAZ on 20/07/15.
//  Copyright (c) 2015 MPAZ. All rights reserved.
//

#import "Preferences.h"

@implementation Preferences

+ (Preferences *)sharedInstance{
    static Preferences *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[Preferences alloc] init];
    });
    return _sharedInstance;
}

- (NSString *)getData:(NSString *)keyIndentifier{
    return [[NSUserDefaults standardUserDefaults] valueForKey:keyIndentifier];
}

- (void)setData:(NSString *)keyIdentifier value:(NSString *) value{
    [[NSUserDefaults standardUserDefaults] setValue:value forKey:keyIdentifier];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

@end
