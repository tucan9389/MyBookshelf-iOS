//
//  BookModel.h
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 26/04/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BookModelProtocol <NSObject, NSCoding, NSSecureCoding>

-(NSString *)title;
-(NSString *)subtitle;
-(NSString *)imageURL;
-(NSString *)isbn13;
-(NSString *)price;
-(NSString *)url;

@end

@interface BookModel : NSObject<BookModelProtocol>

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) NSString *isbn13;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *url;

- (instancetype) initWithInfo: (NSDictionary *)info;

@end

NS_ASSUME_NONNULL_END
