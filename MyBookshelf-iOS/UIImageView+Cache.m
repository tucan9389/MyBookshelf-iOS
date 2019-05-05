//
//  UIImageView+Cache.m
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 05/05/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import "UIImageView+Cache.h"
#import "DYImageCacheManager.h"

@implementation UIImageView (Cache)

-(void)loadImageWithURL:(NSURL *)url {
    [self setupNilImage];
    
    UIImage *image = [[DYImageCacheManager shared] getCachedImageForKey:url.absoluteString];
    if (image) {
        [self setNonnilImage: image];
    } else {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSData* data = [NSData dataWithContentsOfURL:url];
            UIImage *image = [UIImage imageWithData:data];
            [[DYImageCacheManager shared] cacheImage:image forKey:url.absoluteString];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (image) {
                    [self setNonnilImage: image];
                } else {
                    [self setupNilImage];
                }
                
            });
        });
    }
}

-(void)setNonnilImage:(UIImage *)image {
    self.image = image;
    self.backgroundColor = [UIColor clearColor];
}

-(void)setupNilImage {
    self.image = nil;
    self.backgroundColor = [UIColor grayColor];
}

@end
