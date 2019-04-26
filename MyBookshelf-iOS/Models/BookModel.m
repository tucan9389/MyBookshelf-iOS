//
//  BookModel.m
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 26/04/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import "BookModel.h"

@implementation BookModel

- (instancetype) initWithInfo: (NSDictionary *)info {
    self = [super init];
    if(self) {
        NSLog(@"_init: %@", self);
        if (info[@"title"]) self.title = info[@"title"];
        if (info[@"subtitle"]) self.subtitle = info[@"subtitle"];
        if (info[@"imageURL"]) self.imageURL = info[@"imageURL"];
        if (info[@"isbn13"]) self.isbn13 = info[@"isbn13"];
        if (info[@"price"]) self.price = info[@"price"];
        if (info[@"url"]) self.url = info[@"url"];
    }
    return self;
}

@end
