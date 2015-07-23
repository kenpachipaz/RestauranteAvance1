//
//  Maker.m
//  Restaurante
//
//  Created by MPAZ on 21/07/15.
//  Copyright (c) 2015 MPAZ. All rights reserved.
//

#import "Maker.h"

@implementation Maker

@synthesize title, subtitle, coordinate;

- (id)initWithTitle:(NSString *)aTitle subtitle:(NSString*)aSubtitle andCoordinate:(CLLocationCoordinate2D)coord{
    self = [super init];
    title = aTitle;
    subtitle = aSubtitle;
    coordinate = coord;
    return self;
}
@end
