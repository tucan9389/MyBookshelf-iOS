//
//  BookDetailModel.m
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 26/04/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import "BookDetailModel.h"

@implementation BookDetailModel

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
        
        if (info[@"desc"]) self.desc = info[@"desc"];
        if (info[@"rating"]) self.rating = info[@"rating"];
        if (info[@"authors"]) self.authors = info[@"authors"];
        if (info[@"publisher"]) self.publisher = info[@"publisher"];
        if (info[@"language"]) self.language = info[@"language"];
        if (info[@"pages"]) self.pages = info[@"pages"];
        if (info[@"year"]) self.year = info[@"year"];
        if (info[@"isbn10"]) self.isbn10 = info[@"isbn10"];
        if (info[@"error"]) self.error = info[@"error"];
    }
    return self;
}

@end
