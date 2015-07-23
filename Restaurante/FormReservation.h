//
//  FormReservation.h
//  Restaurante
//
//  Created by MPAZ on 21/07/15.
//  Copyright (c) 2015 MPAZ. All rights reserved.
//

@class  Reservaciones;

#import <UIKit/UIKit.h>
#import "SelectedTable.h"

@interface FormReservation : UIViewController <FormViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *tfUserReserv;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic)NSString *table;


@property (weak, nonatomic) IBOutlet UILabel *lblTable;
@property (weak, nonatomic) IBOutlet UILabel *lblFecha;
@property (nonatomic, strong) Reservaciones *itemToView;

@property (weak, nonatomic) IBOutlet UIButton *btnCancel;
@property (weak, nonatomic) IBOutlet UIButton *btnReserve;
@property (weak, nonatomic) IBOutlet UIButton *selectedTable;
@end
