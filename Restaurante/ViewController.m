//
//  ViewController.m
//  Restaurante
//
//  Created by MPAZ on 17/07/15.
//  Copyright (c) 2015 MPAZ. All rights reserved.
//

#import "ViewController.h"
#import "ConnectWS.h"
#import "Utils.h"
#import "Preferences.h"
#import "HomeViewController.h"
#import <AFNetworking.h>
#import "CreditosView.h"


NSString *const kResponse=@"Usuario y/o Password incorrectos";
NSString *const kKeyIdentifier=@"us.gonet.preferences.name";
NSString *const kNameDictionary=@"nombre";
NSString *const kErrorKnown=@"Revise si tiene acceso a Internet";
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
    __block NSString *name;
    
    NSString *path= [Utils getValidateUrl:self.tfUsuario.text password:self.tfPassword.text];
    [[ConnectWS sharedInstance]getDataFromWebServices:path blockResponse:^(id response){
        if ([response isKindOfClass:[NSArray class]]) {
                NSDictionary *dictionary= [response objectAtIndex:0];
                name=dictionary[kNameDictionary];
            
                [[Preferences sharedInstance]setData:kKeyIdentifier value:name];
                [self dismissViewControllerAnimated:YES completion:nil];
                HomeViewController *homeViewController=[[HomeViewController alloc]init];
                //[self.navigationController pushViewController:homeViewController animated:YES];
                [self presentViewController:homeViewController animated:YES completion:NULL];
            
        }else if([response isKindOfClass:[NSDictionary class]]){
                name=response[kNameDictionary];
                [Utils showAlertMessage:name];
        }else{
                [Utils showAlertMessage:kErrorKnown];
        }
    }];
}

@end
