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
#import "CreditosView.h"
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)viewMenu:(id)sender {
    MenuView *menuView=[[MenuView alloc] init];
    //[self presentViewController:menuView animated:YES completion:nil];
}


- (IBAction)viewCredits:(id)sender {
//    CreditosView *creditsView= [[CreditosView alloc]init];
//    [self.navigationController pushViewController:creditsView animated:YES];
   
}
- (IBAction)viewMap:(id)sender {
    UbicacionView *homeViewController=[[UbicacionView alloc]init];
    //[self.navigationController pushViewController:homeViewController animated:YES];
    [self presentViewController:homeViewController animated:YES completion:NULL];
}
@end
