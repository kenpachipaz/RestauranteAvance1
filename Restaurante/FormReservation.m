//
//  FormReservation.m
//  Restaurante
//
//  Created by MPAZ on 21/07/15.
//  Copyright (c) 2015 MPAZ. All rights reserved.
//

#import "FormReservation.h"
#import "Preferences.h"
#import "Utils.h"
#import "SelectedTable.h"
#import "ConnectWS.h"
#import "Reservaciones.h"

NSString *const kKeyIdentifierNameForm=@"us.gonet.preferences.name";
NSString *const kKeyIdentifierUserForm=@"us.gonet.preferences.user";

@interface FormReservation ()

@end

@implementation FormReservation

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tfUserReserv.text=[[Preferences sharedInstance]getData:kKeyIdentifierNameForm];
    if(self.itemToView){
        self.lblTable.text=[@"Mesa: " stringByAppendingString:self.itemToView.mesa];
        self.lblFecha.text=[@"Fecha: " stringByAppendingString:self.itemToView.fecha];
        
        self.btnReserve.hidden= YES;
        self.datePicker.hidden= YES;
        self.selectedTable.hidden=YES;
    }else{
        self.btnCancel.hidden=YES;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)selectedTable:(id)sender{
    SelectedTable *selectedTable= [[SelectedTable alloc] init];
    NSDateFormatter* df = [[NSDateFormatter alloc]init];
    df.dateFormat = @"dd/MM/yyyy";
    NSString* dateStringPicker = [df stringFromDate:self.datePicker.date];
    selectedTable.delegate= self;
    selectedTable.dateTable=dateStringPicker;
    [self.navigationController pushViewController:selectedTable animated:YES];
}
- (IBAction)reserve:(id)sender {
    
    NSDateFormatter* df = [[NSDateFormatter alloc]init];
    df.dateFormat = @"dd/MM/yyyy";
    NSString* dateStringPicker = [df stringFromDate:self.datePicker.date];
    NSString* dateToday=[df stringFromDate:[NSDate date]];
    
    NSString *name = [[Preferences sharedInstance]getData:kKeyIdentifierUserForm];
    
    if (![self.lblTable.text isEqualToString:@"Mesa: "]) {
        if([dateStringPicker isEqualToString:dateToday]){
            NSString *mesa = [self.lblTable.text substringWithRange:NSMakeRange(6, 1)];
            NSString *path=[Utils getReservacionesUrl:name mesa:mesa fecha:dateStringPicker];
            [self reservation:path];
        }else if([[NSDate date] compare:self.datePicker.date]==NSOrderedAscending){
            NSLog(@"fecha futura");
            NSString *mesa = [self.lblTable.text substringWithRange:NSMakeRange(6, 1)];
            NSString *path=[Utils getReservacionesUrl:name mesa:mesa fecha:dateStringPicker];
            [self reservation:path];
        }else{
            [Utils showAlertMessage:@"Fecha Invalida"];
        }
    }else{
        [Utils showAlertMessage:@"Seleccione una mesa"];
    }
    
}
- (IBAction)canceledReservation:(id)sender {
    NSString *path=[Utils getDeleteUrl:self.itemToView.idMesa];
    NSDictionary *dictionaryMSG =[[ConnectWS sharedInstance]getDataFromWebServices:path];
    [Utils showAlertMessage:dictionaryMSG[@"msg"]];
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)formViewController:(SelectedTable *)viewController didAddItem:(NSString *)table{
    self.lblTable.text=table;
}
- (void)reservation:(NSString *)pathUrl{
    NSDictionary *dictionaryMSG =[[ConnectWS sharedInstance]getDataFromWebServices:pathUrl];
    [Utils showAlertMessage:dictionaryMSG[@"msg"]];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
