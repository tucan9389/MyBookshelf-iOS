//
//  DYImageCacheManager.h
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 05/05/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DYImageCacheManager : NSObject

+(DYImageCacheManager *)shared;
- (void)cacheImage:(UIImage*)image forKey:(NSString*)key;
- (UIImage*)getCachedImageForKey:(NSString*)key;

@end

NS_ASSUME_NONNULL_END
