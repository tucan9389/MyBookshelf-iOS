//
//  BookDetailModel.h
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 26/04/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BookDetailModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) NSString *isbn13;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *url;

@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *rating;
@property (nonatomic, strong) NSString *authors;
@property (nonatomic, strong) NSString *publisher;
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *pages;
@property (nonatomic, strong) NSString *year;
@property (nonatomic, strong) NSString *isbn10;
@property (nonatomic, strong) NSString *error;


- (instancetype) initWithInfo: (NSDictionary *)info;

@end

NS_ASSUME_NONNULL_END
