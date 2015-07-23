//
//  CellViewController.m
//  Restaurante
//
//  Created by MPAZ on 21/07/15.
//  Copyright (c) 2015 MPAZ. All rights reserved.
//

#import "CellViewController.h"
#import "Cell.h"
#import "Utils.h"
#import "MenuItem.h"
#import <UIImageView+AFNetworking.h>
@interface CellViewController ()

@end

@implementation CellViewController
@synthesize platillos;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *pathUrl = [Utils getMenuUrl:@"2"];
    platillos = [Utils getMenuArray:pathUrl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return platillos.count;
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MenuItem *imgenMenu = self.platillos[indexPath.row];
    NSURL *thumdnailurl=[NSURL URLWithString:imgenMenu.imagenUrl];
    NSString *nombre= [imgenMenu.name stringByAppendingFormat:@" %@",imgenMenu.precio];
    Cell *celda = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
        celda.labelCell.text = nombre;
                
       [celda.imagenCell setImageWithURL:thumdnailurl];
        
        return celda;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(65, 0, 0, 0);
}

@end
