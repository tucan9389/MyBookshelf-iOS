//
//  BookDBManager.h
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 04/05/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class BookModel;
@interface BookDBManager : NSObject

-(instancetype)initWithKey:(NSString *)key;
-(NSMutableArray *)bookmarks;
-(void)saveWithBookmarks:(NSArray *) bookmarks;
-(void)addBook:(BookModel *)model;
-(void)removeBook:(BookModel *)model;

@end

NS_ASSUME_NONNULL_END
