//
//  Photo.h
//  2w3d3_instaKilo
//
//  Created by Seantastic31 on 12/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

@import UIKit;

@interface Photo : NSObject

@property (strong, nonatomic) UIImage *photo;
@property (strong, nonatomic) NSString *location;
@property (strong, nonatomic) NSString *subject;

- (instancetype)initWithPhoto:(UIImage*)photo andLocation:(NSString*)location andSubject:(NSString*)subject;


@end
