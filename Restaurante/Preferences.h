//
//  Preferences.h
//  Restaurante
//
//  Created by MPAZ on 20/07/15.
//  Copyright (c) 2015 MPAZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Preferences : NSObject

+ (Preferences *)sharedInstance;
- (NSString *)getData:(NSString *)keyIndentifier;
- (void)setData:(NSString *)keyIdentifier value:(NSString *) value;

@end
