//
//  BookmarkManager.h
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 04/05/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class BookModel;
@interface BookmarkManager : NSObject

+(BookmarkManager *)shared;

-(void)bookmarkWithDetailModel: (BookModel *)book;
-(void)unbookmarkWithDetailModel: (BookModel *)book;
-(NSArray *)bookmarks;
-(BOOL)contains: (BookModel *)book;

@end

NS_ASSUME_NONNULL_END
