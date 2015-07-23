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


NSString *const kResponse=@"Usuario y/o Password incorrectos";
NSString *const kKeyIdentifierName=@"us.gonet.preferences.name";
NSString *const kKeyIdentifierUser=@"us.gonet.preferences.user";
NSString *const kNameDictionary=@"nombre";
NSString *const kErrorKnown=@"Revise si tiene acceso a Internet";
NSString *const kIdentifierSegueLogin=@"validateLogin";


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tfPassword.secureTextEntry = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if ([identifier isEqualToString:kIdentifierSegueLogin]) {
        return [self responseMenu:self.tfUsuario.text password:self.tfPassword.text];
    }
    return  NO;
}
- (IBAction)login:(id)sender {
    
    
}

- (BOOL)responseMenu:(NSString *)user password:(NSString *)password{
    NSString *name;
    NSString *path= [Utils getValidateUrl:user password:password];
    id array= [[ConnectWS sharedInstance] getDataFromWebServices:path];
    if ([array isKindOfClass:[NSArray class]]) {
            NSDictionary *dictionary= [array objectAtIndex:0];
            name=dictionary[kNameDictionary];
        
            [[Preferences sharedInstance]setData:kKeyIdentifierName value:name];
            [[Preferences sharedInstance]setData:kKeyIdentifierUser value:user];
        
        [self dismissViewControllerAnimated:YES completion:nil];
        return YES;
      }else if([array isKindOfClass:[NSDictionary class]]){
           name=array[kNameDictionary];
           [Utils showAlertMessage:name];
          return NO;
      }else{
            [Utils showAlertMessage:kErrorKnown];
          return NO;
      }
    return NO;
}

@end
