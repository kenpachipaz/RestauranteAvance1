//
//  Maker.h
//  Restaurante
//
//  Created by MPAZ on 21/07/15.
//  Copyright (c) 2015 MPAZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface Maker : NSObject <MKAnnotation>{
    NSString *title;
    NSString *subtitle;
    CLLocationCoordinate2D coordinate;
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithTitle:(NSString *)aTitle subtitle:(NSString*)aSubtitle andCoordinate:(CLLocationCoordinate2D)coord;

@end
