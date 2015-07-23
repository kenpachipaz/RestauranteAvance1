//
//  PostresCell.m
//  Restaurante
//
//  Created by MPAZ on 21/07/15.
//  Copyright (c) 2015 MPAZ. All rights reserved.
//

#import "PostresCell.h"
#import "Cell.h"
#import "Utils.h"
#import "MenuItem.h"
#import <UIImageView+AFNetworking.h>
@interface PostresCell ()

@end

@implementation PostresCell
@synthesize postres;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *pathUrl = [Utils getMenuUrl:@"3"];
    postres = [Utils getMenuArray:pathUrl];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return postres.count;
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MenuItem *imgenMenu = self.postres[indexPath.row];
    NSURL *thumdnailurl=[NSURL URLWithString:imgenMenu.imagenUrl];

    NSString *nombre= [imgenMenu.name stringByAppendingFormat:@" %@",imgenMenu.precio];
    Cell *celda = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    celda.labelCell2.text = nombre;
    
    [celda.imagenCell2 setImageWithURL:thumdnailurl];
    
    return celda;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(65, 0, 0, 0);
}

@end
