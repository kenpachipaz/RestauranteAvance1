//
//  ReservacionesView.h
//  Restaurante
//
//  Created by MPAZ on 20/07/15.
//  Copyright (c) 2015 MPAZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReservacionesView : UIViewController 
@property (nonatomic, strong) NSArray *objects;
@property (weak, nonatomic) IBOutlet UITableView *reservaciones;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
