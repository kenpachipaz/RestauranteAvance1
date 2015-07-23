//
//  ReservacionesView.m
//  Restaurante
//
//  Created by MPAZ on 20/07/15.
//  Copyright (c) 2015 MPAZ. All rights reserved.
//

#import "ReservacionesView.h"
#import "FormReservation.h"
#import "Utils.h"
#import "ConnectWS.h"
#import "Preferences.h"
#import "Reservaciones.h"

NSString *const kIdentifierUserFormR=@"us.gonet.preferences.user";
NSString *const kNameDictionaryR=@"usuario";

@interface ReservacionesView ()

@end

@implementation ReservacionesView
@synthesize objects;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showForm:)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    NSString *user=[[Preferences sharedInstance] getData:kIdentifierUserFormR];
    NSString *pathUrl= [Utils getMyReservationsUrl:user];    id response= [Utils getReservacionesArray:pathUrl];
    
    if([response isKindOfClass:[NSArray class]]){
        self.objects=response;
    }else{
        
        [Utils showAlertMessage:response];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void) showForm:(id)sender{
    FormReservation *formReservation= [[FormReservation alloc] init];
    [self.navigationController pushViewController:formReservation animated:YES];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    Reservaciones *item= self.objects[indexPath.row];
    
    if(cell == nil){
        cell= [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    }
    
    if(indexPath.row % 2){
        cell.backgroundColor= [UIColor colorWithRed:0.86 green:0.776 blue:0.592 alpha:1.0];
    }else{
        cell.backgroundColor= [UIColor colorWithRed:0.651 green:0.3 blue:0.1 alpha:1.0];
    }
    cell.textLabel.text= [@"Mesa " stringByAppendingString:item.mesa];
    cell.detailTextLabel.text=item.fecha;
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Mis Reservaciones";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Reservaciones *item= self.objects[indexPath.row];
   
    FormReservation *viewController = [[FormReservation alloc] init];
    viewController.itemToView= item;
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self viewDidLoad];
    [self.tableView reloadData];

}

@end
