//
//  UbicacionView.m
//  Restaurante
//
//  Created by MPAZ on 20/07/15.
//  Copyright (c) 2015 MPAZ. All rights reserved.
//

#import "UbicacionView.h"
#import "Maker.h"

CGFloat const kLatitude= 19.043823;
CGFloat const kLongitude= -98.196959;
NSString *const kTitleMap=@"Restaurante Casa de Los Muñecos";
NSString *const kSubtitleMap=@"Alta Cocina Mexicana";

@interface UbicacionView ()

@end

@implementation UbicacionView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setMap];    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setMap{
    CLLocationCoordinate2D initialLocation;
    initialLocation.latitude = kLatitude;
    initialLocation.longitude= kLongitude;
    
    MKCoordinateRegion restaurante = MKCoordinateRegionMakeWithDistance(initialLocation, 100, 100);
    [self.mapView setRegion:restaurante animated:YES];
    
    CLLocationCoordinate2D newCoord = {kLatitude, kLongitude};
    Maker *annotation = [[Maker alloc]initWithTitle:kTitleMap
                                           subtitle:kSubtitleMap
                                      andCoordinate:newCoord];
    [self.mapView addAnnotation:annotation];
}
@end
