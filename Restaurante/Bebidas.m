//
//  Bebidas.m
//  Restaurante
//
//  Created by MPAZ on 21/07/15.
//  Copyright (c) 2015 MPAZ. All rights reserved.
//

#import "Bebidas.h"
#import "Cell.h"
#import "Utils.h"
#import "MenuItem.h"
#import <UIImageView+AFNetworking.h>
@interface Bebidas ()

@end

@implementation Bebidas
@synthesize bebidas;


- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *pathUrl = [Utils getMenuUrl:@"1"];
    bebidas= [Utils getMenuArray:pathUrl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return bebidas.count;
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MenuItem *imgenMenu = self.bebidas[indexPath.row];
    NSURL *thumdnailurl=[NSURL URLWithString:imgenMenu.imagenUrl];
    
    NSString *nombre= [imgenMenu.name stringByAppendingFormat:@" %@",imgenMenu.precio];
    Cell *celda = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    celda.labelCell3.text = nombre;

    [celda.imagenCell3 setImageWithURL:thumdnailurl];
    
    return celda;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(65, 0, 0, 0);
}

@end
