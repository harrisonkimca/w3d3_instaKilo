//
//  ViewController.m
//  2w3d3_instaKilo
//
//  Created by Seantastic31 on 12/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "ViewController.h"
#import "Photo.h"
#import "PhotoViewCell.h"

@interface ViewController ()<UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray <Photo*>*photos;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.dataSource = self;
    [self createData];
    
}

- (void)createData
{
    Photo *photo1 = [[Photo alloc]initWithPhoto:[UIImage imageNamed:@"bird1"] andLocation:@"Toronto" andSubject:@"Chance"];
    Photo *photo2 = [[Photo alloc]initWithPhoto:[UIImage imageNamed:@"bird2"] andLocation:@"New York" andSubject:@"Fortune"];
    Photo *photo3 = [[Photo alloc]initWithPhoto:[UIImage imageNamed:@"bird3"] andLocation:@"Los Angeles" andSubject:@"Serendipity"];
    Photo *photo4 = [[Photo alloc]initWithPhoto:[UIImage imageNamed:@"bird4"] andLocation:@"Vancouver" andSubject:@"Providence"];
    Photo *photo5 = [[Photo alloc]initWithPhoto:[UIImage imageNamed:@"cat1"] andLocation:@"Toronto" andSubject:@"Chance"];
    Photo *photo6 = [[Photo alloc]initWithPhoto:[UIImage imageNamed:@"cat2"] andLocation:@"New York" andSubject:@"Fortune"];
    Photo *photo7 = [[Photo alloc]initWithPhoto:[UIImage imageNamed:@"cat3"] andLocation:@"Los Angeles" andSubject:@"Serendipity"];
    Photo *photo8 = [[Photo alloc]initWithPhoto:[UIImage imageNamed:@"cat4"] andLocation:@"Vancouver" andSubject:@"Providence"];
    Photo *photo9 = [[Photo alloc]initWithPhoto:[UIImage imageNamed:@"dog1"] andLocation:@"Toronto" andSubject:@"Chance"];
    Photo *photo10 = [[Photo alloc]initWithPhoto:[UIImage imageNamed:@"dog2"] andLocation:@"New York" andSubject:@"Fortune"];
    Photo *photo11 = [[Photo alloc]initWithPhoto:[UIImage imageNamed:@"dog3"] andLocation:@"Los Angeles" andSubject:@"Serendipity"];
    Photo *photo12 = [[Photo alloc]initWithPhoto:[UIImage imageNamed:@"dog4"] andLocation:@"Vancouver" andSubject:@"Providence"];
    
    self.photos = @[photo1, photo2, photo3, photo4, photo5, photo6, photo7, photo8, photo9, photo10, photo11, photo12];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photos.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
    PhotoViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    Photo *photo = self.photos [indexPath.row];
    
    cell.imageView.image = photo.photo;
    return cell;
}





@end
