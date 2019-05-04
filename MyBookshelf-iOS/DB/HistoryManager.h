//
//  HistoryManager.h
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 04/05/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class BookModel;
@interface HistoryManager : NSObject

+(HistoryManager *)shared;

-(void)readWithDetailModel: (BookModel *)bookDetail;
//-(void)unbookmarkWithDetailModel: (BookDetailModel *)bookDetail;
-(NSArray *)bookmarks;

@end

NS_ASSUME_NONNULL_END
