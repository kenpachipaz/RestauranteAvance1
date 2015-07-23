//
//  HomeViewController.m
//  Restaurante
//
//  Created by MPAZ on 20/07/15.
//  Copyright (c) 2015 MPAZ. All rights reserved.
//

#import "HomeViewController.h"
#import "Preferences.h"
#import "MenuView.h"
#import "UbicacionView.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)exit:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
