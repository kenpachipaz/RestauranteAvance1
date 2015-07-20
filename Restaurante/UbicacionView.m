//
//  UbicacionView.m
//  Restaurante
//
//  Created by MPAZ on 20/07/15.
//  Copyright (c) 2015 MPAZ. All rights reserved.
//

#import "UbicacionView.h"


@interface UbicacionView ()

@end

@implementation UbicacionView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CLLocationCoordinate2D initialLocation;
    
    initialLocation.latitude=19.043823;
    initialLocation.longitude=-98.196959;
    MKCoordinateRegion restaurante = MKCoordinateRegionMakeWithDistance(initialLocation, 100, 100);
    [self.mapView setRegion:restaurante animated:YES];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
