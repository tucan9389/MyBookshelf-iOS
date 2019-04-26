//
//  BookStoreAPIClient.h
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 26/04/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class BookDetailModel;
@interface BookStoreAPIClient : NSObject

+(BookStoreAPIClient *)shared;

-(void)requestNewWithCompletion: (void (^)(NSArray *))completion;
-(void)requestSearchWithQuery: (NSString *)query page: (NSNumber *)page completion: (void (^)(NSArray *))completion;
-(void)requestDetailBookWithQuery: (NSNumber *)isbn13 completion: (void (^)(BookDetailModel *))completion;

@end

NS_ASSUME_NONNULL_END