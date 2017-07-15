//
//  Photo.m
//  2w3d3_instaKilo
//
//  Created by Seantastic31 on 12/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (instancetype)initWithImage:(UIImage *)image andLocation:(NSString *)location andSubject:(NSString *)subject
{
    self = [super init];
    if (self) {
        _image = image;
        _location = location;
        _subject = subject;
    }
    return self;
}

@end
