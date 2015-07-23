//
//  SelectedTable.m
//  Restaurante
//
//  Created by MPAZ on 21/07/15.
//  Copyright (c) 2015 MPAZ. All rights reserved.
//

#import "SelectedTable.h"
#import "FormReservation.h"
#import "Utils.h"
#import "ConnectWS.h"

@interface SelectedTable ()

@end

@implementation SelectedTable

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *pathStatusUrl=[Utils getStatusMesasUrl:self.dateTable];
    NSArray *data=[[ConnectWS sharedInstance]getDataFromWebServices:pathStatusUrl];
    if([data isKindOfClass:[NSArray class]]){
        for (int i=0; i < data.count; i++) {
            NSDictionary *dictionaryStatus=[data objectAtIndex:i];
            NSInteger mesa=[dictionaryStatus[@"mesa"]integerValue];
            UIImage *image=[UIImage imageNamed:@"reserved.png"];
            switch (mesa) {
                case 1:
                    [self.btnTable1 setImage:image forState:UIControlStateNormal];
                    [self.btnTable1 setEnabled:NO];
                    break;
                case 2:
                    [self.btnTable2 setImage:image forState:UIControlStateNormal];
                    [self.btnTable2 setEnabled:NO];
                    break;
                case 3:
                    [self.btnTable3 setImage:image forState:UIControlStateNormal];
                    [self.btnTable3 setEnabled:NO];
                    break;
                case 4:
                    [self.btnTable4 setImage:image forState:UIControlStateNormal];
                    [self.btnTable4 setEnabled:NO];
                    break;
                case 5:
                    [self.btnTable5 setImage:image forState:UIControlStateNormal];
                    [self.btnTable5 setEnabled:NO];
                    break;
                case 6:
                    [self.btnTsble6 setImage:image forState:UIControlStateNormal];
                    [self.btnTsble6 setEnabled:NO];
                    break;
            }
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)selectedTableOne:(id)sender {
    [self getTable:@"Mesa: 1"];
}
- (IBAction)selectedTableTwo:(id)sender {
    [self getTable:@"Mesa: 2"];
}
- (IBAction)selectedTableThree:(id)sender {
    [self getTable:@"Mesa: 3"];
}
- (IBAction)selectedTableFour:(id)sender {
    [self getTable:@"Mesa: 4"];
}
- (IBAction)selectedTableFive:(id)sender {
    [self getTable:@"Mesa: 5"];
}
- (IBAction)selectedTableSix:(id)sender {
    [self getTable:@"Mesa: 6"];
}

- (void)getTable:(NSString *)numberTable{
    if(self.delegate){
        [self.delegate formViewController:self didAddItem:numberTable];
        if([self.delegate respondsToSelector:@selector(formViewControllerDidClose:)]){
            [self.delegate formViewControllerDidClose:self];
        }
        
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
