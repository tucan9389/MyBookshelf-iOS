//
//  DYImageCacheManager.m
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 05/05/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import "DYImageCacheManager.h"

@interface DYImageCacheManager ()

@property (nonatomic, strong) NSCache *cache;

@end

@implementation DYImageCacheManager

static DYImageCacheManager *_sharedInstance = nil;

+(DYImageCacheManager *)shared {
    @synchronized([DYImageCacheManager class]) {
        if (!_sharedInstance)
            _sharedInstance = [[self alloc] init];
        return _sharedInstance;
    }
    return nil;
}

-(instancetype)init {
    self = [super init];
    if (self) {
        self.cache = [[NSCache alloc] init];
    }
    return self;
}

- (void)cacheImage:(UIImage*)image forKey:(NSString*)key {
    [self.cache setObject:image forKey:key];
}

- (UIImage*)getCachedImageForKey:(NSString*)key {
    return [self.cache objectForKey:key];
}

@end
