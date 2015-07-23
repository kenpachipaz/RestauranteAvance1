//
//  Cell3ViewController.m
//  PruebaCollectionView
//
//  Created by MAC COMPARTIDA3 on 21/07/15.
//  Copyright (c) 2015 MAC COMPARTIDA3. All rights reserved.
//

#import "Cell3ViewController.h"
#import "Cell.h"

@interface Cell3ViewController ()

@end

@implementation Cell3ViewController
@synthesize ejemplo3;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ejemplo3  = [NSMutableArray arrayWithObjects:@"BUHO", @"COLIBRÍ", @"CUERVO", @"FLAMENCO", @"KIWI", @"LORO", @"PAVO", @"PINGÜINO", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return ejemplo3.count;
}


-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    // Me creo un objeto de la Clase Celda
    
    
    
    
    UITabBar *tabBar = self.tabBarController.tabBar;
    UITabBarItem *item0 = [tabBar.items objectAtIndex:0];
    UITabBarItem *item1 = [tabBar.items objectAtIndex:1];
    UITabBarItem *item2 = [tabBar.items objectAtIndex:2];
    
    
    [item1 setTitle:@"Postres"];
    [item2 setTitle:@"Bebidas"];
    
    
    
    if([item2 respondsToSelector:@selector(accessibilityActivate)]){
        
        Cell *celda = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
        celda.labelCell3.text = self.ejemplo3[indexPath.row];
        
        UIImage *img;
        
        
        switch (indexPath.row) {
            case 0:
                img = [UIImage imageNamed:@"im_buho.jpg"];
                break;
            case 1:
                img = [UIImage imageNamed:@"im_colibri.jpg"];
                break;
            case 2:
                img = [UIImage imageNamed:@"im_cuervo.jpg"];
                break;
            case 3:
                img = [UIImage imageNamed:@"im_flamenco.jpg"];
                break;
            case 4:
                img = [UIImage imageNamed:@"im_kiwi.jpg"];
                break;
            case 5:
                img = [UIImage imageNamed:@"im_loro.jpg"];
                break;
            case 6:
                img = [UIImage imageNamed:@"im_pavo.jpg"];
                break;
            case 7:
                img = [UIImage imageNamed:@"im_pinguino.jpg"];
                break;
            default:
                break;
        }
        celda.imagenCell3.image = img;
        
        return celda;
        
    }
    
    
    
    return nil;
}






@end
