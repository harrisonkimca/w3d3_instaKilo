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
#import "CollectionReusableView.h"

@interface ViewController ()<UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray <Photo*>*photos;
@property (strong, nonatomic) NSMutableDictionary *subjectDictionary;
@property (strong, nonatomic) NSMutableDictionary *locationDictionary;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.dataSource = self;
    self.subjectDictionary = [[NSMutableDictionary alloc]init];
    self.locationDictionary = [[NSMutableDictionary alloc]init];
    [self createData];
    [self sortPhotos:self.photos];
}

- (void)createData
{
    Photo *photo1 = [[Photo alloc]initWithImage:[UIImage imageNamed:@"bird1"] andLocation:@"Toronto" andSubject:@"Chance"];
    Photo *photo2 = [[Photo alloc]initWithImage:[UIImage imageNamed:@"bird2"] andLocation:@"New York" andSubject:@"Fortune"];
    Photo *photo3 = [[Photo alloc]initWithImage:[UIImage imageNamed:@"bird3"] andLocation:@"Los Angeles" andSubject:@"Serendipity"];
    Photo *photo4 = [[Photo alloc]initWithImage:[UIImage imageNamed:@"bird4"] andLocation:@"Vancouver" andSubject:@"Providence"];
    Photo *photo5 = [[Photo alloc]initWithImage:[UIImage imageNamed:@"cat1"] andLocation:@"Toronto" andSubject:@"Chance"];
    Photo *photo6 = [[Photo alloc]initWithImage:[UIImage imageNamed:@"cat2"] andLocation:@"New York" andSubject:@"Fortune"];
    Photo *photo7 = [[Photo alloc]initWithImage:[UIImage imageNamed:@"cat3"] andLocation:@"Los Angeles" andSubject:@"Serendipity"];
    Photo *photo8 = [[Photo alloc]initWithImage:[UIImage imageNamed:@"cat4"] andLocation:@"Vancouver" andSubject:@"Providence"];
    Photo *photo9 = [[Photo alloc]initWithImage:[UIImage imageNamed:@"dog1"] andLocation:@"Toronto" andSubject:@"Chance"];
    Photo *photo10 = [[Photo alloc]initWithImage:[UIImage imageNamed:@"dog2"] andLocation:@"New York" andSubject:@"Fortune"];
    Photo *photo11 = [[Photo alloc]initWithImage:[UIImage imageNamed:@"dog3"] andLocation:@"Los Angeles" andSubject:@"Serendipity"];
    Photo *photo12 = [[Photo alloc]initWithImage:[UIImage imageNamed:@"dog4"] andLocation:@"Vancouver" andSubject:@"Providence"];
    
    self.photos = @[photo1, photo2, photo3, photo4, photo5, photo6, photo7, photo8, photo9, photo10, photo11, photo12];
}

#pragma mark - Sort Photos Into Sections

- (void)sortPhotos:(NSArray*)array
{
    for (Photo *photo in self.photos)
    {
        // check to see if key for subject exists & if does not then make new array using subject as key
        if (!self.subjectDictionary[photo.subject])
        {
            NSMutableArray *initArray = [[NSMutableArray alloc]initWithObjects:photo, nil];
            self.subjectDictionary[photo.subject] = initArray;
        }
        // if key for subject already exists pull array & add new photo and then return to dictionary
        else
        {
            NSMutableArray *updateArray = self.subjectDictionary[photo.subject];
            [updateArray addObject:photo];
            self.subjectDictionary[photo.subject] = updateArray;
        }
        
        if (!self.locationDictionary[photo.location])
        {
            NSMutableArray *initArray = [[NSMutableArray alloc]initWithObjects:photo, nil];
            self.locationDictionary[photo.location] = initArray;
        }
        
        else
        {
            NSMutableArray *updateArray = self.locationDictionary[photo.location];
            [updateArray addObject:photo];
            self.locationDictionary[photo.location] = updateArray;
        }
    }
    NSLog(@"subjectDictionary: %@", self.subjectDictionary);
    NSLog(@"locationDictionary: %@", self.locationDictionary);
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (self.segmentedControl.selectedSegmentIndex == 0)
    {
        NSArray *keys = [self.subjectDictionary allKeys];
        return keys.count;
    }
    else
    {
        NSArray *keys = [self.locationDictionary allKeys];
        return keys.count;
    }
    
    //return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.segmentedControl.selectedSegmentIndex == 0)
    {
        NSArray *values = [self.subjectDictionary allValues];
        return [[values objectAtIndex:section] count];
    }
    else
    {
        NSArray *values = [self.locationDictionary allValues];
        return [[values objectAtIndex:section] count];
    }
    
    //return self.photos.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
    PhotoViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    
    if (self.segmentedControl.selectedSegmentIndex == 0)
    {
        NSArray *values = [self.subjectDictionary allValues];
        NSArray *photos = [values objectAtIndex:indexPath.section];
        cell.photo = photos[indexPath.row];
    }
    else
    {
        NSArray *values = [self.locationDictionary allValues];
        NSArray *photos = [values objectAtIndex:indexPath.section];
        cell.photo = photos[indexPath.row];
    }
    
    //Photo *photo = self.photos [indexPath.row];
    //cell.imageView.image = photo.image;
    
    return cell;
}

- (IBAction)segmentedControlSwitch:(UISegmentedControl *)sender
{
    [self.collectionView reloadData];
}

- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        CollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HeaderID" forIndexPath:indexPath];
        
        if (self.segmentedControl.selectedSegmentIndex == 0)
        {
            NSArray *keys = [self.subjectDictionary allKeys];
            NSString *subject  = keys[indexPath.section];
            headerView.headerSectionLabel.text = [NSString stringWithFormat:@"%@", subject];
        }
        else
        {
            NSArray *keys = [self.locationDictionary allKeys];
            NSString *location  = keys[indexPath.section];
            headerView.headerSectionLabel.text = [NSString stringWithFormat:@"%@", location];
        }
        //UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier: @"HeaderID" forIndexPath:indexPath];
        
        //UILabel *headerLabel = [header viewWithTag:100];
        //headerLabel.text = [NSString stringWithFormat:@"Section %ld", indexPath.section];
        //return header;
        
        return headerView;
    }
    return nil;
}



@end
