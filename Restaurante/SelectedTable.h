//
//  SelectedTable.h
//  Restaurante
//
//  Created by MPAZ on 21/07/15.
//  Copyright (c) 2015 MPAZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SelectedTable;

@protocol FormViewControllerDelegate <NSObject>

- (void)formViewController:(SelectedTable *)viewController didAddItem:(NSString *)table;
@optional
- (void)formViewControllerDidClose:(SelectedTable *)viewController;
@end

@interface SelectedTable : UIViewController

@property (nonatomic, assign) id<FormViewControllerDelegate> delegate;
@property (nonatomic, weak)NSString *dateTable;

@property (weak, nonatomic) IBOutlet UIButton *btnTable1;
@property (weak, nonatomic) IBOutlet UIButton *btnTable2;
@property (weak, nonatomic) IBOutlet UIButton *btnTable3;
@property (weak, nonatomic) IBOutlet UIButton *btnTable4;
@property (weak, nonatomic) IBOutlet UIButton *btnTable5;
@property (weak, nonatomic) IBOutlet UIButton *btnTsble6;

@end
