//
//  PhotoViewCell.m
//  2w3d3_instaKilo
//
//  Created by Seantastic31 on 12/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "PhotoViewCell.h"

@implementation PhotoViewCell

- (void)setPhoto:(Photo *)photo
{
    _photo = photo;
    [self configure];
}

- (void)configure
{
    self.imageView.image = self.photo.image
    ;
}

@end
